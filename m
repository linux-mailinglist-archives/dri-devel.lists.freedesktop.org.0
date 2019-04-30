Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D34F1BF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 10:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C33894EA;
	Tue, 30 Apr 2019 08:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E5EC894EB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 08:03:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8B3EA72155; Tue, 30 Apr 2019 08:03:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110514] [CI][BAT] igt@* - skip - Test requirement:
 is_i915_device(fd) && has_known_intel_chipset(fd), Skip
Date: Tue, 30 Apr 2019 08:03:29 +0000
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
Message-ID: <bug-110514-502-kefi0TJCAh@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0169567455=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0169567455==
Content-Type: multipart/alternative; boundary="15566114092.44fCe4.13371"
Content-Transfer-Encoding: 7bit


--15566114092.44fCe4.13371
Date: Tue, 30 Apr 2019 08:03:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110514

--- Comment #23 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- CML: all tests - skip - Test requirement: .* (gen|intel_gen(.*)) &gt;=3D=
 .*,
SKIP -}
{+ CML: all tests - skip - Test requirement: .*(gen|intel_gen(.*)) .*, SKIP=
 +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt@kms_univer=
sal_plane@universal-plane-gen9-features-pipe-b.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@kms_univer=
sal_plane@universal-plane-gen9-features-pipe-a.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@kms_univer=
sal_plane@universal-plane-gen9-features-pipe-b.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@kms_univer=
sal_plane@universal-plane-gen9-features-pipe-c.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt@kms_univer=
sal_plane@universal-plane-gen9-features-pipe-a.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt@kms_univer=
sal_plane@universal-plane-gen9-features-pipe-c.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt@kms_unive=
rsal_plane@universal-plane-gen9-features-pipe-a.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt@kms_unive=
rsal_plane@universal-plane-gen9-features-pipe-b.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt@kms_unive=
rsal_plane@universal-plane-gen9-features-pipe-c.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15566114092.44fCe4.13371
Date: Tue, 30 Apr 2019 08:03:29 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110514#c23">Comme=
nt # 23</a>
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

{- CML: all tests - skip - Test requirement: .* (gen|intel_gen(.*)) &amp;gt=
;=3D .*,
SKIP -}
{+ CML: all tests - skip - Test requirement: .*(gen|intel_gen(.*)) .*, SKIP=
 +}

New failures caught by the filter:

  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt=
&#64;kms_universal_plane&#64;universal-plane-gen9-features-pipe-b.html">htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt&#64;kms_unive=
rsal_plane&#64;universal-plane-gen9-features-pipe-b.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;kms_universal_plane&#64;universal-plane-gen9-features-pipe-a.html">htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;kms_unive=
rsal_plane&#64;universal-plane-gen9-features-pipe-a.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;kms_universal_plane&#64;universal-plane-gen9-features-pipe-b.html">htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;kms_unive=
rsal_plane&#64;universal-plane-gen9-features-pipe-b.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;kms_universal_plane&#64;universal-plane-gen9-features-pipe-c.html">htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;kms_unive=
rsal_plane&#64;universal-plane-gen9-features-pipe-c.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt=
&#64;kms_universal_plane&#64;universal-plane-gen9-features-pipe-a.html">htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt&#64;kms_unive=
rsal_plane&#64;universal-plane-gen9-features-pipe-a.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt=
&#64;kms_universal_plane&#64;universal-plane-gen9-features-pipe-c.html">htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/drmtip_265/fi-cml-u/igt&#64;kms_unive=
rsal_plane&#64;universal-plane-gen9-features-pipe-c.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/ig=
t&#64;kms_universal_plane&#64;universal-plane-gen9-features-pipe-a.html">ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt&#64;kms_uni=
versal_plane&#64;universal-plane-gen9-features-pipe-a.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/ig=
t&#64;kms_universal_plane&#64;universal-plane-gen9-features-pipe-b.html">ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt&#64;kms_uni=
versal_plane&#64;universal-plane-gen9-features-pipe-b.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/ig=
t&#64;kms_universal_plane&#64;universal-plane-gen9-features-pipe-c.html">ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6001/re-cml-u/igt&#64;kms_uni=
versal_plane&#64;universal-plane-gen9-features-pipe-c.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15566114092.44fCe4.13371--

--===============0169567455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0169567455==--
