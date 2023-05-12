const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');


const app = express();
app.use(express.json());



app.use(cors());
const pool = new Pool({
    // Update these values with your PostgreSQL connection details
    user: 'postgres',
    host: 'localhost',
    database: 'maxillaris',
    password: '123',
    port: 5432,
});


app.get('/personas', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM persona order by idpersona');
        res.json(result.rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.get('/personas/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const result = await pool.query('SELECT * FROM persona WHERE idpersona = $1', [id]);
        if (result.rowCount === 0) {
            res.status(404).json({ error: 'Persona no encontarda' });
        } else {
            res.json(result.rows[0]);
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.post('/personas', async (req, res) => {
    try {
        const { nombres, apepaterno, apematerno, documento, fechanacimiento, email, direccion, idregion, idprovincia, iddistrito } = req.body;
        const result = await pool.query(
            'INSERT INTO persona (nombres, apepaterno, apematerno, documento, fechanacimiento, email, direccion, idregion, idprovincia, iddistrito) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9,$10) RETURNING *',
            [nombres, apepaterno, apematerno, documento, fechanacimiento, email, direccion, idregion, idprovincia, iddistrito]
        );
        res.status(201).json(result.rows[0]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.put('/personas/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const { nombres, apepaterno, apematerno, documento, fechanacimiento, email, direccion, idregion, idprovincia, iddistrito } = req.body;
        const result = await pool.query(
            'UPDATE persona SET nombres = $1 ,apepaterno =$2 ,apematerno =$3 ,documento =$4 ,fechanacimiento =$5 ,email =$6 ,direccion =$7 ,idregion =$8 ,idprovincia =$9 ,iddistrito =$10 WHERE idpersona = $11 RETURNING *',
            [nombres, apepaterno, apematerno, documento, fechanacimiento, email, direccion, idregion, idprovincia, iddistrito, id]
        );
        if (result.rowCount === 0) {
            res.status(404).json({ error: 'Persona no encontarda' });
        } else {
            res.json(result.rows[0]);
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.delete('/personas/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const result = await pool.query('DELETE FROM persona WHERE idpersona=$1', [id]);
        if (result.rowCount === 0) {
            res.status(404).json({ error: 'Persona no encontarda' });
        } else {
            res.status(200).json({ message: 'Persona eliminada' });
        }
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server listening on port ${port}`));