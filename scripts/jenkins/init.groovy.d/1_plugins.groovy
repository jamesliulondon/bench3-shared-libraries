import jenkins.model.*
import java.util.logging.Logger

Logger logger = Logger.getLogger("")

logger.info "Execute init script"

Jenkins.instance.setDisableRememberMe(true)
Jenkins.instance.setSystemMessage('<h1>Jenkins Server - Automating Jenkins with Groovy</h1>')
Jenkins.instance.save()

logger.info "Init script complete"