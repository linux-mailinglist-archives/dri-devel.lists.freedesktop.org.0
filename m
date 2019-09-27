Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27459C046F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 13:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307C26EE56;
	Fri, 27 Sep 2019 11:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 649206EEC3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 11:36:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5A3C972167; Fri, 27 Sep 2019 11:36:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111747] [CI][DRMTIP] igt@ - incomplete - Jenkins gives up
Date: Fri, 27 Sep 2019 11:36:03 +0000
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
Message-ID: <bug-111747-502-TYXhTcZJAk@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0714042364=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0714042364==
Content-Type: multipart/alternative; boundary="15695841631.642A1A.7229"
Content-Transfer-Encoding: 7bit


--15695841631.642A1A.7229
Date: Fri, 27 Sep 2019 11:36:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111747

--- Comment #9 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- TGL: igt@* -incomplete - Abort requested by .* terminating children -}
{+ TGL: igt@* -incomplete - Abort requested by .* terminating children +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6960/shard-tglb1/igt@kms_cu=
rsor_crc@pipe-a-cursor-512x512-onscreen.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6960/shard-tglb4/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6960/shard-tglb6/igt@i915_p=
m_rpm@gem-pread.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6961/shard-tglb3/igt@i915_p=
m_rpm@drm-resources-equal.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb2/igt@i915_s=
elftest@mock_fence.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb2/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb3/igt@i915_p=
m_backlight@fade_with_dpms.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb4/igt@gem_fe=
nce_thrash@bo-write-verify-threaded-x.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb5/igt@i915_p=
m_rpm@gem-pread.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb6/igt@kms_ad=
dfb_basic@tile-pitch-mismatch.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695841631.642A1A.7229
Date: Fri, 27 Sep 2019 11:36:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747#c9">Commen=
t # 9</a>
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
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6960/shard-tglb1=
/igt&#64;kms_cursor_crc&#64;pipe-a-cursor-512x512-onscreen.html">https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6960/shard-tglb1/igt&#64;kms_cursor_c=
rc&#64;pipe-a-cursor-512x512-onscreen.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6960/shard-tglb4=
/igt&#64;kms_frontbuffer_tracking&#64;psr-1p-primscrn-pri-indfb-draw-mmap-c=
pu.html">https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6960/shard-tglb4/i=
gt&#64;kms_frontbuffer_tracking&#64;psr-1p-primscrn-pri-indfb-draw-mmap-cpu=
.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6960/shard-tglb6=
/igt&#64;i915_pm_rpm&#64;gem-pread.html">https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_6960/shard-tglb6/igt&#64;i915_pm_rpm&#64;gem-pread.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6961/shard-tglb3=
/igt&#64;i915_pm_rpm&#64;drm-resources-equal.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_6961/shard-tglb3/igt&#64;i915_pm_rpm&#64;drm-resour=
ces-equal.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb2=
/igt&#64;i915_selftest&#64;mock_fence.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_6963/shard-tglb2/igt&#64;i915_selftest&#64;mock_fence.html=
</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb2=
/igt&#64;kms_frontbuffer_tracking&#64;psr-1p-primscrn-pri-shrfb-draw-blt.ht=
ml">https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb2/igt&#6=
4;kms_frontbuffer_tracking&#64;psr-1p-primscrn-pri-shrfb-draw-blt.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb3=
/igt&#64;i915_pm_backlight&#64;fade_with_dpms.html">https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_6963/shard-tglb3/igt&#64;i915_pm_backlight&#64;fad=
e_with_dpms.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb4=
/igt&#64;gem_fence_thrash&#64;bo-write-verify-threaded-x.html">https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb4/igt&#64;gem_fence_thra=
sh&#64;bo-write-verify-threaded-x.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb5=
/igt&#64;i915_pm_rpm&#64;gem-pread.html">https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_6963/shard-tglb5/igt&#64;i915_pm_rpm&#64;gem-pread.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb6=
/igt&#64;kms_addfb_basic&#64;tile-pitch-mismatch.html">https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_6963/shard-tglb6/igt&#64;kms_addfb_basic&#64;ti=
le-pitch-mismatch.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695841631.642A1A.7229--

--===============0714042364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0714042364==--
