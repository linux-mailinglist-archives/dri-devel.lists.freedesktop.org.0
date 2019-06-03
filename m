Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FD532D98
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 12:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7A1891F4;
	Mon,  3 Jun 2019 10:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CDA889217
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 10:12:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0990872167; Mon,  3 Jun 2019 10:12:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110823] [Intel-GFX-CI][BAT] igt@amdgpu/amd_basic@userptr - fail
 - Failed assertion: r == 0
Date: Mon, 03 Jun 2019 10:12:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110823-502-f4rpUnlYiV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110823-502@http.bugs.freedesktop.org/>
References: <bug-110823-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0690312213=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0690312213==
Content-Type: multipart/alternative; boundary="15595567200.1C294.1363"
Content-Transfer-Encoding: 7bit


--15595567200.1C294.1363
Date: Mon, 3 Jun 2019 10:11:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110823

--- Comment #1 from CI Bug Log <cibuglog@gmail.com> ---
The CI Bug Log issue associated to this bug has been updated.

### New filters associated

* VEGA M: igt@amdgpu/amd_basic@userptr - fail - Failed assertion: r =3D=3D 0
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13156/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4368/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5027/fi-kbl-8809g/igt@amdgpu/a=
md_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6172/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6173/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3085/fi-kbl-8809g/igt@amdgpu=
/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13143/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3086/fi-kbl-8809g/igt@amdgpu=
/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6174/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3089/fi-kbl-8809g/igt@amdgpu=
/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3090/fi-kbl-8809g/igt@amdgpu=
/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6176/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13148/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3091/fi-kbl-8809g/igt@amdgpu=
/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13149/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3087/fi-kbl-8809g/igt@amdgpu=
/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13145/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13147/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4356/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13153/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6178/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4358/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13154/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6175/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13146/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4357/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3088/fi-kbl-8809g/igt@amdgpu=
/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4359/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4361/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4362/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4363/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4365/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4366/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6179/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4360/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4364/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4367/fi-kbl-8809g/igt@amdgp=
u/amd_basic@userptr.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13155/fi-kbl-8809g/igt@a=
mdgpu/amd_basic@userptr.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595567200.1C294.1363
Date: Mon, 3 Jun 2019 10:11:59 +0000
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
   title=3D"NEW - [Intel-GFX-CI][BAT] igt&#64;amdgpu/amd_basic&#64;userptr =
- fail - Failed assertion: r =3D=3D 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110823#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Intel-GFX-CI][BAT] igt&#64;amdgpu/amd_basic&#64;userptr =
- fail - Failed assertion: r =3D=3D 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110823">bug 11082=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>The CI Bug Log issue associated to this bug has been updated.

### New filters associated

* VEGA M: igt&#64;amdgpu/amd_basic&#64;userptr - fail - Failed assertion: r=
 =3D=3D 0
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13156/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13156/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4368/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4368/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5027/fi-kbl-8809g/i=
gt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tree/=
drm-tip/IGT_5027/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6172/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_6172/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6173/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_6173/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3085/fi-kbl-8809g=
/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_3085/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html=
</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13143/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13143/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3086/fi-kbl-8809g=
/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_3086/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html=
</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6174/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_6174/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3089/fi-kbl-8809g=
/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_3089/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html=
</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3090/fi-kbl-8809g=
/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_3090/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html=
</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6176/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_6176/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13148/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13148/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3091/fi-kbl-8809g=
/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_3091/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html=
</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13149/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13149/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3087/fi-kbl-8809g=
/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_3087/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html=
</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13145/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13145/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13147/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13147/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4356/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4356/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13153/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13153/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6178/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_6178/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4358/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4358/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13154/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13154/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6175/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_6175/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13146/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13146/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4357/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4357/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3088/fi-kbl-8809g=
/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_3088/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html=
</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4359/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4359/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4361/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4361/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4362/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4362/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4363/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4363/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4365/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4365/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4366/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4366/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6179/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_6179/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4360/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4360/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4364/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4364/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_4367/fi-kbl-8809=
g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Trybot_4367/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;userptr.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_13155/fi-kbl-=
8809g/igt&#64;amdgpu/amd_basic&#64;userptr.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_13155/fi-kbl-8809g/igt&#64;amdgpu/amd_basic&#64;us=
erptr.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595567200.1C294.1363--

--===============0690312213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0690312213==--
