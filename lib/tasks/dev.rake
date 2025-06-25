# ✅ Deux tâches pour RuboCop :

# rake rubocop:auto_correct → corrige automatiquement les offenses.

# rake rubocop:lint → inspecte seulement.

# ✅ Trois tâches pour Solargraph :

# rake solargraph:check → pour les diagnostics.

# rake solargraph:download_core → pour les docs internes.

# rake solargraph:start_server → pour lancer le LSP manuellement.




# ✅ RuboCop Tasks
namespace :rubocop do
  desc "Run RuboCop and auto-correct offenses"
  task :auto_correct do
    sh "bundle exec rubocop -A"
  end

  desc "Run RuboCop without auto-correct"
  task :lint do
    sh "bundle exec rubocop"
  end
end

# ✅ Solargraph Tasks
namespace :solargraph do
  desc "Scan Solargraph workspace for problems"
  task :check do
    sh "bundle exec solargraph scan"
  end

  desc "Download Solargraph core documentation"
  task :download_core do
    sh "bundle exec solargraph download-core"
  end

  desc "Start Solargraph language server (for debug)"
  task :start_server do
    sh "bundle exec solargraph stdio"
  end
end
