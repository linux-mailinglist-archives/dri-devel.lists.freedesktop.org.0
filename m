Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B2FF1CD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 10:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416F489518;
	Tue, 30 Apr 2019 08:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BC6B89518
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 08:09:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 486A972155; Tue, 30 Apr 2019 08:09:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110514] [CI][BAT] igt@* - skip - Test requirement:
 is_i915_device(fd) && has_known_intel_chipset(fd), Skip
Date: Tue, 30 Apr 2019 08:09:27 +0000
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
Message-ID: <bug-110514-502-ww1bprjbOc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1883216008=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1883216008==
Content-Type: multipart/alternative; boundary="15566117670.C1FBEB38c.15964"
Content-Transfer-Encoding: 7bit


--15566117670.C1FBEB38c.15964
Date: Tue, 30 Apr 2019 08:09:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110514

--- Comment #24 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- CML: all tests - skip - Test requirement: .*(gen|intel_gen(.*)) .*, SKIP=
 -}
{+ CML: all tests - skip - Test requirement: .*(gen|intel_gen(.*)) .*, SKIP=
 +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt@kms_frontb=
uffer_tracking@fbc-indfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@kms_frontb=
uffer_tracking@fbcpsr-indfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@kms_frontb=
uffer_tracking@fbc-shrfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@kms_frontb=
uffer_tracking@fbc-indfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@kms_frontb=
uffer_tracking@psr-indfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@kms_frontb=
uffer_tracking@psr-shrfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@kms_frontb=
uffer_tracking@fbcpsr-shrfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt@kms_frontb=
uffer_tracking@fbcpsr-shrfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt@kms_frontb=
uffer_tracking@psr-indfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt@kms_front=
buffer_tracking@fbc-indfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt@kms_front=
buffer_tracking@fbcpsr-indfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt@kms_front=
buffer_tracking@fbcpsr-shrfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt@kms_front=
buffer_tracking@fbc-shrfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt@kms_front=
buffer_tracking@psr-indfb-scaledprimary.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt@kms_front=
buffer_tracking@psr-shrfb-scaledprimary.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15566117670.C1FBEB38c.15964
Date: Tue, 30 Apr 2019 08:09:27 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110514#c24">Comme=
nt # 24</a>
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
        <pre>A CI Bug Log filter associated to this bug has been updated:

{- CML: all tests - skip - Test requirement: .*(gen|intel_gen(.*)) .*, SKIP=
 -}
{+ CML: all tests - skip - Test requirement: .*(gen|intel_gen(.*)) .*, SKIP=
 +}

New failures caught by the filter:

  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt=
&#64;kms_frontbuffer_tracking&#64;fbc-indfb-scaledprimary.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt&#64;kms_frontbuffer_t=
racking&#64;fbc-indfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;kms_frontbuffer_tracking&#64;fbcpsr-indfb-scaledprimary.html">https://=
intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;kms_frontbuffe=
r_tracking&#64;fbcpsr-indfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;kms_frontbuffer_tracking&#64;fbc-shrfb-scaledprimary.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;kms_frontbuffer_t=
racking&#64;fbc-shrfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;kms_frontbuffer_tracking&#64;fbc-indfb-scaledprimary.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;kms_frontbuffer_t=
racking&#64;fbc-indfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;kms_frontbuffer_tracking&#64;psr-indfb-scaledprimary.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;kms_frontbuffer_t=
racking&#64;psr-indfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;kms_frontbuffer_tracking&#64;psr-shrfb-scaledprimary.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;kms_frontbuffer_t=
racking&#64;psr-shrfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;kms_frontbuffer_tracking&#64;fbcpsr-shrfb-scaledprimary.html">https://=
intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;kms_frontbuffe=
r_tracking&#64;fbcpsr-shrfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt=
&#64;kms_frontbuffer_tracking&#64;fbcpsr-shrfb-scaledprimary.html">https://=
intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt&#64;kms_frontbuffe=
r_tracking&#64;fbcpsr-shrfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt=
&#64;kms_frontbuffer_tracking&#64;psr-indfb-scaledprimary.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt&#64;kms_frontbuffer_t=
racking&#64;psr-indfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/ig=
t&#64;kms_frontbuffer_tracking&#64;fbc-indfb-scaledprimary.html">https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt&#64;kms_frontbuffer=
_tracking&#64;fbc-indfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/ig=
t&#64;kms_frontbuffer_tracking&#64;fbcpsr-indfb-scaledprimary.html">https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt&#64;kms_frontbuf=
fer_tracking&#64;fbcpsr-indfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/ig=
t&#64;kms_frontbuffer_tracking&#64;fbcpsr-shrfb-scaledprimary.html">https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt&#64;kms_frontbuf=
fer_tracking&#64;fbcpsr-shrfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/ig=
t&#64;kms_frontbuffer_tracking&#64;fbc-shrfb-scaledprimary.html">https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt&#64;kms_frontbuffer=
_tracking&#64;fbc-shrfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/ig=
t&#64;kms_frontbuffer_tracking&#64;psr-indfb-scaledprimary.html">https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt&#64;kms_frontbuffer=
_tracking&#64;psr-indfb-scaledprimary.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/ig=
t&#64;kms_frontbuffer_tracking&#64;psr-shrfb-scaledprimary.html">https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt&#64;kms_frontbuffer=
_tracking&#64;psr-shrfb-scaledprimary.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15566117670.C1FBEB38c.15964--

--===============1883216008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1883216008==--
