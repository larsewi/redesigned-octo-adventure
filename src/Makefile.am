BUILD_TARGETS = $(top_builddir)/core/ \
	$(top_builddir)/masterfiles/

if HAVE_ENTERPRISE
BUILD_TARGETS +=  $(top_builddir)/enterprise/ \
	$(top_builddir)/nova/ \
	$(top_builddir)/mission-portal/
endif

all-local: $(BUILD_TARGETS)

clean-local:
	rm -rf $(top_builddir)/core/
	rm -rf $(top_builddir)/masterfiles/
	rm -rf $(top_builddir)/enterprise/
	rm -rf $(top_builddir)/nova/
	rm -rf $(top_builddir)/mission-portal/

$(top_builddir)/core/:
	@RSYNC@ -a $(top_srcdir)/@CORE_DIRECTORY@/ $(top_builddir)/core

$(top_builddir)/masterfiles/:
	@RSYNC@ -a $(top_srcdir)/@MASTERFILES_DIRECTORY@/ $(top_builddir)/masterfiles

$(top_builddir)/enterprise/:
	@RSYNC@ -a $(top_srcdir)/@ENTERPRISE_DIRECTORY@/ $(top_builddir)/enterprise

$(top_builddir)/nova/:
	@RSYNC@ -a $(top_srcdir)/@NOVA_DIRECTORY@/ $(top_builddir)/nova

$(top_builddir)/mission-portal/:
	@RSYNC@ -a $(top_srcdir)/@MISSION_PORTAL_DIRECTORY@/ $(top_builddir)/mission-portal
