import express, { json, urlencoded } from "express";
import cookieParser from "cookie-parser";
import logger from "morgan";

import indexRouter from "./routes/index.js";
import usersRouter from "./routes/users.js";
// import noticiasRouter from "./routes/noticas.js";

const app = express();

app.use(logger("dev"));
app.use(json());
app.use(urlencoded({ extended: false }));
app.use(cookieParser());

// app.use("/", indexRouter);
app.use("/users", usersRouter);

// ROTAS DA APLICAÇÃO BACK-END

import noticiasRouter from './routes/noticias.js'
app.use('/noticias', noticiasRouter)

import lancamentosRouter from './routes/lancamentos.js'
app.use('/lancamentos', lancamentosRouter)

import observatoriosRouter from './routes/observatorios.js'
app.use('/observatorios', observatoriosRouter)

import publicacoesRouter from './routes/publicacoes.js'
app.use('/publicacoes', publicacoesRouter)

import usuariosRouter from './routes/usuarios.js'
app.use('/usuarios', usuariosRouter)


export default app;
