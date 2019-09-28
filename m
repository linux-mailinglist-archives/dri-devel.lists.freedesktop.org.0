Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D45CC1125
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 17:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19FE6E13F;
	Sat, 28 Sep 2019 15:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D464C6E13F
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 15:15:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CC18B72162; Sat, 28 Sep 2019 15:15:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111747] [CI][DRMTIP] igt@ - incomplete - Jenkins gives up
Date: Sat, 28 Sep 2019 15:15:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111747-502-9Lbx13m3Sv@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111747-502@http.bugs.freedesktop.org/>
References: <bug-111747-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0261244918=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0261244918==
Content-Type: multipart/alternative; boundary="15696837060.ED94DBf.11421"
Content-Transfer-Encoding: 7bit


--15696837060.ED94DBf.11421
Date: Sat, 28 Sep 2019 15:15:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111747

--- Comment #11 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- TGL: igt@* -incomplete - Abort requested by .* terminating children -}
{+ TGL: igt@* -incomplete - Abort requested by .* terminating children +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6967/shard-tglb2/igt@gem_pr=
ead@uncached.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6968/shard-tglb1/igt@kms_fr=
ontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6968/shard-tglb3/igt@kms_fl=
ip@dpms-vs-vblank-race.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6968/shard-tglb4/igt@kms_fr=
ontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6969/shard-tglb3/igt@kms_fr=
ontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6969/shard-tglb6/igt@gem_ex=
ec_parallel@vcs1-fds.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u/igt@drm_import=
_export@import-close-race-prime.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u2/igt@gem_tiled=
_blits@normal.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u2/igt@kms_atomi=
c_interruptible@legacy-pageflip.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u2/igt@drm_impor=
t_export@import-close-race-prime.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6970/shard-tglb4/igt@kms_vb=
lank@pipe-c-query-idle-hang.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6971/shard-tglb3/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-180.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696837060.ED94DBf.11421
Date: Sat, 28 Sep 2019 15:15:06 +0000
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
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747">bug 11174=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>A CI Bug Log filter associated to this bug has been updated:

{- TGL: igt&#64;* -incomplete - Abort requested by .* terminating children =
-}
{+ TGL: igt&#64;* -incomplete - Abort requested by .* terminating children =
+}

New failures caught by the filter:

  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6967/shard-tglb2=
/igt&#64;gem_pread&#64;uncached.html">https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_6967/shard-tglb2/igt&#64;gem_pread&#64;uncached.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6968/shard-tglb1=
/igt&#64;kms_frontbuffer_tracking&#64;fbcpsr-rgb101010-draw-blt.html">https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6968/shard-tglb1/igt&#64;kms_fro=
ntbuffer_tracking&#64;fbcpsr-rgb101010-draw-blt.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6968/shard-tglb3=
/igt&#64;kms_flip&#64;dpms-vs-vblank-race.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_6968/shard-tglb3/igt&#64;kms_flip&#64;dpms-vs-vblank-r=
ace.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6968/shard-tglb4=
/igt&#64;kms_frontbuffer_tracking&#64;fbcpsr-rgb101010-draw-mmap-gtt.html">=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6968/shard-tglb4/igt&#64;km=
s_frontbuffer_tracking&#64;fbcpsr-rgb101010-draw-mmap-gtt.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6969/shard-tglb3=
/igt&#64;kms_frontbuffer_tracking&#64;fbc-rgb101010-draw-mmap-cpu.html">htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6969/shard-tglb3/igt&#64;kms_f=
rontbuffer_tracking&#64;fbc-rgb101010-draw-mmap-cpu.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6969/shard-tglb6=
/igt&#64;gem_exec_parallel&#64;vcs1-fds.html">https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_6969/shard-tglb6/igt&#64;gem_exec_parallel&#64;vcs1-fds.=
html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u/igt=
&#64;drm_import_export&#64;import-close-race-prime.html">https://intel-gfx-=
ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u/igt&#64;drm_import_export&#64;im=
port-close-race-prime.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u2/ig=
t&#64;gem_tiled_blits&#64;normal.html">https://intel-gfx-ci.01.org/tree/drm=
-tip/drmtip_379/fi-tgl-u2/igt&#64;gem_tiled_blits&#64;normal.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u2/ig=
t&#64;kms_atomic_interruptible&#64;legacy-pageflip.html">https://intel-gfx-=
ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u2/igt&#64;kms_atomic_interruptibl=
e&#64;legacy-pageflip.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u2/ig=
t&#64;drm_import_export&#64;import-close-race-prime.html">https://intel-gfx=
-ci.01.org/tree/drm-tip/drmtip_379/fi-tgl-u2/igt&#64;drm_import_export&#64;=
import-close-race-prime.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6970/shard-tglb4=
/igt&#64;kms_vblank&#64;pipe-c-query-idle-hang.html">https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_6970/shard-tglb4/igt&#64;kms_vblank&#64;pipe-c-qu=
ery-idle-hang.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6971/shard-tglb3=
/igt&#64;kms_big_fb&#64;y-tiled-64bpp-rotate-180.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_6971/shard-tglb3/igt&#64;kms_big_fb&#64;y-tiled=
-64bpp-rotate-180.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696837060.ED94DBf.11421--

--===============0261244918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0261244918==--
