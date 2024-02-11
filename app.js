const express = require('express');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();
const app = express();


app.use(express.json());



let port = process.env.PORT || 8000
app.listen(port, ()=> console.log('Server on Port :', port))  