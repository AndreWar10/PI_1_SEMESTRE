import { Router } from 'express'
import controller from '../controllers/publicacoes.js'

const router = Router ()

router.post('/', controller.create)
router.get('/', controller.retrieveAll)
router.get('/:id', controller.retrieveOne)
//router.put('/:id', controller.update)
//router.put('/:publicacoesIdId/noticias/:noticiasId', controller.addNoticias)
router.delete('/:id', controller.delete)
//router.delete('/:publicacoesIdId/noticias/:noticiasId', controller.addNoticias)

export default router

