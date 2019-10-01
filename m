Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E2C2D80
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 08:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945B489F55;
	Tue,  1 Oct 2019 06:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59D8C89F55
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 06:30:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5145772167; Tue,  1 Oct 2019 06:30:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111747] [CI][DRMTIP] igt@ - incomplete - Jenkins gives up
Date: Tue, 01 Oct 2019 06:30:02 +0000
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
Message-ID: <bug-111747-502-0SoCtBvWB1@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1311698682=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1311698682==
Content-Type: multipart/alternative; boundary="15699114021.b16c60Ca6.18389"
Content-Transfer-Encoding: 7bit


--15699114021.b16c60Ca6.18389
Date: Tue, 1 Oct 2019 06:30:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111747

--- Comment #14 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- TGL: igt@* -incomplete - Abort requested by .* terminating children -}
{+ TGL: igt@* -incomplete - Abort requested by .* terminating children +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6973/re-tgl1-display/igt@i9=
15_pm_rpm@dpms-mode-unset-lpsp.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6973/re-tgl1-display/igt@km=
s_cursor_legacy@pipe-b-torture-move.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6973/re-tgl1-display/igt@km=
s_rotation_crc@multiplane-rotation-cropping-top.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6974/shard-tglb5/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6976/shard-tglb1/igt@kms_fl=
ip@flip-vs-fences.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6978/shard-tglb3/igt@kms_fr=
ontbuffer_tracking@fbcpsr-rgb565-draw-render.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15699114021.b16c60Ca6.18389
Date: Tue, 1 Oct 2019 06:30:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747#c14">Comme=
nt # 14</a>
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
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6973/re-tgl1-dis=
play/igt&#64;i915_pm_rpm&#64;dpms-mode-unset-lpsp.html">https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_6973/re-tgl1-display/igt&#64;i915_pm_rpm&#64;d=
pms-mode-unset-lpsp.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6973/re-tgl1-dis=
play/igt&#64;kms_cursor_legacy&#64;pipe-b-torture-move.html">https://intel-=
gfx-ci.01.org/tree/drm-tip/CI_DRM_6973/re-tgl1-display/igt&#64;kms_cursor_l=
egacy&#64;pipe-b-torture-move.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6973/re-tgl1-dis=
play/igt&#64;kms_rotation_crc&#64;multiplane-rotation-cropping-top.html">ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6973/re-tgl1-display/igt&#64;=
kms_rotation_crc&#64;multiplane-rotation-cropping-top.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6974/shard-tglb5=
/igt&#64;kms_frontbuffer_tracking&#64;fbc-1p-primscrn-pri-shrfb-draw-mmap-c=
pu.html">https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6974/shard-tglb5/i=
gt&#64;kms_frontbuffer_tracking&#64;fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu=
.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6976/shard-tglb1=
/igt&#64;kms_flip&#64;flip-vs-fences.html">https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_6976/shard-tglb1/igt&#64;kms_flip&#64;flip-vs-fences.html</=
a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6978/shard-tglb3=
/igt&#64;kms_frontbuffer_tracking&#64;fbcpsr-rgb565-draw-render.html">https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6978/shard-tglb3/igt&#64;kms_fro=
ntbuffer_tracking&#64;fbcpsr-rgb565-draw-render.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15699114021.b16c60Ca6.18389--

--===============1311698682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1311698682==--
