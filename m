Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03523311C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 15:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DDA891FD;
	Mon,  3 Jun 2019 13:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 995A98925A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 13:32:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 96BEA72167; Mon,  3 Jun 2019 13:32:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110823] [Intel-GFX-CI][BAT] igt@amdgpu/amd_basic@userptr - fail
 - Failed assertion: r == 0
Date: Mon, 03 Jun 2019 13:32:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chris@chris-wilson.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110823-502-jzGKHkhiyx@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1538749107=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1538749107==
Content-Type: multipart/alternative; boundary="15595687482.20831b88b.19770"
Content-Transfer-Encoding: 7bit


--15595687482.20831b88b.19770
Date: Mon, 3 Jun 2019 13:32:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110823

--- Comment #3 from Chris Wilson <chris@chris-wilson.co.uk> ---
(In reply to Martin Peres from comment #0)
> Hi, it looks like amdgpu's userptrs are now broken:
>=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6179/fi-kbl-8809g/
> igt@amdgpu_amd_basic@userptr.html
>=20=09
> Starting subtest: userptr
> (amd_basic:3888) CRITICAL: Test assertion failure function
> amdgpu_userptr_test, file ../tests/amdgpu/amd_basic.c:1331:
> (amd_basic:3888) CRITICAL: Failed assertion: r =3D=3D 0
> (amd_basic:3888) CRITICAL: Last errno: 19, No such device
> (amd_basic:3888) CRITICAL: error: -19 !=3D 0

Is quite clear for a change.

Now one might argue that amdgpu changing the userptr ABI behind a non-defau=
lt
config option from a default option is a bit mean...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595687482.20831b88b.19770
Date: Mon, 3 Jun 2019 13:32:28 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110823#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Intel-GFX-CI][BAT] igt&#64;amdgpu/amd_basic&#64;userptr =
- fail - Failed assertion: r =3D=3D 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110823">bug 11082=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wil=
son.co.uk&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span></b>
        <pre>(In reply to Martin Peres from <a href=3D"show_bug.cgi?id=3D11=
0823#c0">comment #0</a>)
<span class=3D"quote">&gt; Hi, it looks like amdgpu's userptrs are now brok=
en:
&gt;=20
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6179/fi-kbl=
-8809g/">https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6179/fi-kbl-8809g/=
</a>
&gt; igt&#64;<a href=3D"mailto:amdgpu_amd_basic&#64;userptr.html">amdgpu_am=
d_basic&#64;userptr.html</a>
&gt;=20=09
&gt; Starting subtest: userptr
&gt; (amd_basic:3888) CRITICAL: Test assertion failure function
&gt; amdgpu_userptr_test, file ../tests/amdgpu/amd_basic.c:1331:
&gt; (amd_basic:3888) CRITICAL: Failed assertion: r =3D=3D 0
&gt; (amd_basic:3888) CRITICAL: Last errno: 19, No such device
&gt; (amd_basic:3888) CRITICAL: error: -19 !=3D 0</span >

Is quite clear for a change.

Now one might argue that amdgpu changing the userptr ABI behind a non-defau=
lt
config option from a default option is a bit mean...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595687482.20831b88b.19770--

--===============1538749107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1538749107==--
