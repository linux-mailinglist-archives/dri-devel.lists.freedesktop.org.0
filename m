Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1298DEBBBF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 02:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE5B6E135;
	Fri,  1 Nov 2019 01:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E41C16E135
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 01:38:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DFB7B720E4; Fri,  1 Nov 2019 01:38:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112138] [kernel 5.4-rc4][amdgpu][CIK]: [drm]
 dce110_link_encoder_construct: Failed to get encoder_cap_info from VBIOS with
 error code 4!
Date: Fri, 01 Nov 2019 01:38:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: MasterCATZ@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112138-502-qSTdWTZNYm@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112138-502@http.bugs.freedesktop.org/>
References: <bug-112138-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1326449552=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1326449552==
Content-Type: multipart/alternative; boundary="15725723161.1CCbdB.28348"
Content-Transfer-Encoding: 7bit


--15725723161.1CCbdB.28348
Date: Fri, 1 Nov 2019 01:38:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112138

--- Comment #2 from MasterCATZ <MasterCATZ@hotmail.com> ---
also noticed same issue , causing fan control on my R9 290's to stop=20
and GPU's hitting thermal limits @ 96 Deg because powerplay can not talk to=
 the
cards BIOS=20

Oct 26 08:08:28 aio kernel: [drm] add ip block number 5 <powerplay>
Oct 26 08:08:28 aio kernel: amdgpu: [powerplay] hwmgr_sw_init smu backed is
ci_smu


amdgpu: [powerplay]=20
failed to send message 282 ret is 254


Linux 5.3.8-050308-generic


OpenGL Information
    GL_VENDOR:     X.Org
    GL_RENDERER:   AMD Radeon R9 200 Series (HAWAII, DRM 3.33.0,
5.3.8-050308-generic, LLVM 9.0.0)
    GL_VERSION:    4.5 (Compatibility Profile) Mesa 19.3.0-devel (git-ff6e1=
48
2019-10-29 bionic-oibaf-ppa)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15725723161.1CCbdB.28348
Date: Fri, 1 Nov 2019 01:38:36 +0000
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
   title=3D"NEW - [kernel 5.4-rc4][amdgpu][CIK]: [drm] dce110_link_encoder_=
construct: Failed to get encoder_cap_info from VBIOS with error code 4!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112138#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel 5.4-rc4][amdgpu][CIK]: [drm] dce110_link_encoder_=
construct: Failed to get encoder_cap_info from VBIOS with error code 4!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112138">bug 11213=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
MasterCATZ&#64;hotmail.com" title=3D"MasterCATZ &lt;MasterCATZ&#64;hotmail.=
com&gt;"> <span class=3D"fn">MasterCATZ</span></a>
</span></b>
        <pre>also noticed same issue , causing fan control on my R9 290's t=
o stop=20
and GPU's hitting thermal limits &#64; 96 Deg because powerplay can not tal=
k to the
cards BIOS=20

Oct 26 08:08:28 aio kernel: [drm] add ip block number 5 &lt;powerplay&gt;
Oct 26 08:08:28 aio kernel: amdgpu: [powerplay] hwmgr_sw_init smu backed is
ci_smu


amdgpu: [powerplay]=20
failed to send message 282 ret is 254


Linux 5.3.8-050308-generic


OpenGL Information
    GL_VENDOR:     X.Org
    GL_RENDERER:   AMD Radeon R9 200 Series (HAWAII, DRM 3.33.0,
5.3.8-050308-generic, LLVM 9.0.0)
    GL_VERSION:    4.5 (Compatibility Profile) Mesa 19.3.0-devel (git-ff6e1=
48
2019-10-29 bionic-oibaf-ppa)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15725723161.1CCbdB.28348--

--===============1326449552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1326449552==--
