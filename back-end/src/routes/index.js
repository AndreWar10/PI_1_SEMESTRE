import { Router } from "express";
const router = Router();

/* GET home page. */
router.get("/", function (req, res) {
  res.send("Hello World!");
});

// router.get("/lancamentos", function (req, res) {
//   res.send("Lançamentos!");
// });

// router.get("/noticias", function (req, res) {
//   res.send("Noticias!");
// });

// router.get("/observatorios", function (req, res) {
//   res.send("Observatorios!");
// });

// router.get("/publicacoes", function (req, res) {
//   res.send("Publicacões!");
// });

// router.get("/usuarios", function (req, res) {
//   res.send("Usuários!");
// });

export default router;
