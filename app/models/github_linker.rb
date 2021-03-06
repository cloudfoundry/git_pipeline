class GithubLinker
  attr_reader :repo_url

  def initialize(repo_url)
    @repo_url = repo_url
  end

  def commit_url(sha)
    "#{@repo_url}/commit/#{sha}"
  end

  def ref_url(ref)
    "#{@repo_url}/tree/#{no_origin(ref)}"
  end

  def compare_url(symbolic_from, symbolic_to)
    from = no_origin(symbolic_from)
    to   = no_origin(symbolic_to)
    "#{@repo_url}/compare/#{from}...#{to}"
  end

  private

  def no_origin(ref)
    ref.gsub(%r{origin/}, "")
  end
end
