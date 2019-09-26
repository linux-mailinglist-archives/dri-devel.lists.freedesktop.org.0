Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BFBF099
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 12:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A046ECC6;
	Thu, 26 Sep 2019 10:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1BBEC6ECD2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 10:55:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 18C5072162; Thu, 26 Sep 2019 10:55:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111747] [CI][DRMTIP] igt@ - incomplete - Jenkins gives up
Date: Thu, 26 Sep 2019 10:55:32 +0000
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
Message-ID: <bug-111747-502-ZJOL5HZ0A1@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0558508998=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0558508998==
Content-Type: multipart/alternative; boundary="15694953320.A464eB5.23635"
Content-Transfer-Encoding: 7bit


--15694953320.A464eB5.23635
Date: Thu, 26 Sep 2019 10:55:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111747

--- Comment #7 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- TGL: igt@* -incomplete - Abort requested by .* terminating children -}
{+ TGL: igt@* -incomplete - Abort requested by .* terminating children +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6955/shard-tglb1/igt@i915_p=
m_rpm@system-suspend.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb2/igt@kms_bu=
sy@extended-modeset-hang-oldfb-with-reset-render-a.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb2/igt@kms_ro=
tation_crc@primary-rotation-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb3/igt@kms_cu=
rsor_crc@pipe-c-cursor-256x85-onscreen.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb3/igt@kms_vb=
lank@pipe-c-ts-continuation-modeset-rpm.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb4/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb4/igt@i915_p=
m_rpm@system-suspend.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb5/igt@gem_ct=
x_switch@queue-heavy.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb6/igt@kms_fl=
ip@plain-flip-fb-recreate.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694953320.A464eB5.23635
Date: Thu, 26 Sep 2019 10:55:32 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747#c7">Commen=
t # 7</a>
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
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6955/shard-tglb1=
/igt&#64;i915_pm_rpm&#64;system-suspend.html">https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_6955/shard-tglb1/igt&#64;i915_pm_rpm&#64;system-suspend.=
html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb2=
/igt&#64;kms_busy&#64;extended-modeset-hang-oldfb-with-reset-render-a.html"=
>https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb2/igt&#64;k=
ms_busy&#64;extended-modeset-hang-oldfb-with-reset-render-a.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb2=
/igt&#64;kms_rotation_crc&#64;primary-rotation-270.html">https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb2/igt&#64;kms_rotation_crc&#64=
;primary-rotation-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb3=
/igt&#64;kms_cursor_crc&#64;pipe-c-cursor-256x85-onscreen.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb3/igt&#64;kms_cursor_cr=
c&#64;pipe-c-cursor-256x85-onscreen.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb3=
/igt&#64;kms_vblank&#64;pipe-c-ts-continuation-modeset-rpm.html">https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb3/igt&#64;kms_vblank&#=
64;pipe-c-ts-continuation-modeset-rpm.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb4=
/igt&#64;kms_frontbuffer_tracking&#64;fbc-1p-primscrn-indfb-plflip-blt.html=
">https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb4/igt&#64;=
kms_frontbuffer_tracking&#64;fbc-1p-primscrn-indfb-plflip-blt.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb4=
/igt&#64;i915_pm_rpm&#64;system-suspend.html">https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_6956/shard-tglb4/igt&#64;i915_pm_rpm&#64;system-suspend.=
html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb5=
/igt&#64;gem_ctx_switch&#64;queue-heavy.html">https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_6956/shard-tglb5/igt&#64;gem_ctx_switch&#64;queue-heavy.=
html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6956/shard-tglb6=
/igt&#64;kms_flip&#64;plain-flip-fb-recreate.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_6956/shard-tglb6/igt&#64;kms_flip&#64;plain-flip-fb=
-recreate.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694953320.A464eB5.23635--

--===============0558508998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0558508998==--
