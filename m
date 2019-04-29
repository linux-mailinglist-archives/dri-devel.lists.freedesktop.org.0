Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB118DD86
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 10:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88238905A;
	Mon, 29 Apr 2019 08:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E3E98902A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 08:17:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6A58472155; Mon, 29 Apr 2019 08:17:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110514] [CI][BAT] igt@* - skip - Test requirement:
 is_i915_device(fd) && has_known_intel_chipset(fd), Skip
Date: Mon, 29 Apr 2019 08:17:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110514-502-BmsXa9Mldf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110514-502@http.bugs.freedesktop.org/>
References: <bug-110514-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1680457654=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1680457654==
Content-Type: multipart/alternative; boundary="15565258353.0AA158C1D.16474"
Content-Transfer-Encoding: 7bit


--15565258353.0AA158C1D.16474
Date: Mon, 29 Apr 2019 08:17:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110514

--- Comment #22 from CI Bug Log <cibuglog@gmail.com> ---
The CI Bug Log issue associated to this bug has been updated.

### New filters associated

* CML: igt@gem_mocs_settings@.* - skip - Test requirement:
get_mocs_settings(fd, &amp;table, false), SKIP
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-ctx-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-isolation-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-isolation-vebox.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-ctx-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-ctx-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-ctx-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-ctx-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-vebox.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-ctx-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-isolation-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-ctx-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-isolation-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-vebox.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-isolation-vebox.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-ctx-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-ctx-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-ctx-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-ctx-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-vebox.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-ctx-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-vebox.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-isolation-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-ctx-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-isolation-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-vebox.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-isolation-vebox.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-ctx-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-ctx-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-ctx-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-ctx-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-blt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-settings-vebox.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-rc6-ctx-dirty-render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt@gem_mocs_s=
ettings@mocs-reset-vebox.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565258353.0AA158C1D.16474
Date: Mon, 29 Apr 2019 08:17:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][BAT] igt&#64;* - skip - Test requirement:=
 is_i915_device(fd) &amp;&amp; has_known_intel_chipset(fd), Skip"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110514#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][BAT] igt&#64;* - skip - Test requirement:=
 is_i915_device(fd) &amp;&amp; has_known_intel_chipset(fd), Skip"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110514">bug 11051=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>The CI Bug Log issue associated to this bug has been updated.

### New filters associated

* CML: igt&#64;gem_mocs_settings&#64;.* - skip - Test requirement:
get_mocs_settings(fd, &amp;amp;table, false), SKIP
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-ctx-dirty-render.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings=
&#64;mocs-settings-ctx-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-isolation-render.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs=
-isolation-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-isolation-vebox.html">https://intel-gfx-ci.=
01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-=
isolation-vebox.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-render.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-res=
et-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-dirty-render.html">https://intel-gfx-=
ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mo=
cs-reset-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-ctx-render.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs=
-reset-ctx-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-ctx-dirty-render.html">https://intel-=
gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#6=
4;mocs-reset-ctx-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-render.html">https://intel-gfx-ci.=
01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-=
settings-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-ctx-render.html">https://intel-gfx=
-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;m=
ocs-settings-ctx-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-ctx-render.html">https://intel-gfx-ci.0=
1.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-r=
c6-ctx-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-blt.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-set=
tings-blt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-blt.html">https://intel-gfx-ci.01.org/t=
ree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-rc6-blt.=
html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-dirty-render.html">https://intel-g=
fx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64=
;mocs-settings-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-blt.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-reset-=
blt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-vebox.html">https://intel-gfx-ci.0=
1.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-s=
ettings-vebox.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-ctx-dirty-render.html">https://intel-gf=
x-ci.01.org/tree/drm-tip/drmtip_267/fi-cml-u/igt&#64;gem_mocs_settings&#64;=
mocs-rc6-ctx-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-isolation-blt.html">https://intel-gfx-ci.01=
.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-is=
olation-blt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-ctx-dirty-render.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings=
&#64;mocs-settings-ctx-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-isolation-render.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs=
-isolation-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-vebox.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-rc6-ve=
box.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-isolation-vebox.html">https://intel-gfx-ci.=
01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-=
isolation-vebox.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-render.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-res=
et-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-render.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-rc6-r=
ender.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-dirty-render.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs=
-rc6-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-dirty-render.html">https://intel-gfx-=
ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mo=
cs-reset-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-ctx-render.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs=
-reset-ctx-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-ctx-dirty-render.html">https://intel-=
gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#6=
4;mocs-reset-ctx-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-render.html">https://intel-gfx-ci.=
01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-=
settings-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-ctx-render.html">https://intel-gfx=
-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;m=
ocs-settings-ctx-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-ctx-render.html">https://intel-gfx-ci.0=
1.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-r=
c6-ctx-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-blt.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-set=
tings-blt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-blt.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-reset-=
blt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-vebox.html">https://intel-gfx-ci.0=
1.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-s=
ettings-vebox.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-ctx-dirty-render.html">https://intel-gf=
x-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;=
mocs-rc6-ctx-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_268/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-vebox.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_268/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-rese=
t-vebox.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-isolation-blt.html">https://intel-gfx-ci.01=
.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-is=
olation-blt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-ctx-dirty-render.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings=
&#64;mocs-settings-ctx-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-isolation-render.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs=
-isolation-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-vebox.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-rc6-ve=
box.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-isolation-vebox.html">https://intel-gfx-ci.=
01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-=
isolation-vebox.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-render.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-res=
et-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-render.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-rc6-r=
ender.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-dirty-render.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs=
-rc6-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-dirty-render.html">https://intel-gfx-=
ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mo=
cs-reset-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-ctx-render.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs=
-reset-ctx-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-ctx-dirty-render.html">https://intel-=
gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#6=
4;mocs-reset-ctx-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-render.html">https://intel-gfx-ci.=
01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-=
settings-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-ctx-render.html">https://intel-gfx=
-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;m=
ocs-settings-ctx-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-ctx-render.html">https://intel-gfx-ci.0=
1.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-r=
c6-ctx-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-blt.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-set=
tings-blt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-blt.html">https://intel-gfx-ci.01.org/t=
ree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-rc6-blt.=
html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-dirty-render.html">https://intel-g=
fx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64=
;mocs-settings-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-blt.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-reset-=
blt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-settings-vebox.html">https://intel-gfx-ci.0=
1.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-s=
ettings-vebox.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-rc6-ctx-dirty-render.html">https://intel-gf=
x-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;=
mocs-rc6-ctx-dirty-render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_269/fi-cml-u/igt=
&#64;gem_mocs_settings&#64;mocs-reset-vebox.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_269/fi-cml-u/igt&#64;gem_mocs_settings&#64;mocs-rese=
t-vebox.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565258353.0AA158C1D.16474--

--===============1680457654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1680457654==--
