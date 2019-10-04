Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F616CC29F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 20:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24686EC0A;
	Fri,  4 Oct 2019 18:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25D546EC0B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 18:27:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2312872162; Fri,  4 Oct 2019 18:27:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110994] [vega10] *ERROR* Failed to initialize parser -125! ,
 running libreoffice
Date: Fri, 04 Oct 2019 18:27:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sleijeri@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110994-502-ZnquMHwk4K@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110994-502@http.bugs.freedesktop.org/>
References: <bug-110994-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0072817563=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0072817563==
Content-Type: multipart/alternative; boundary="15702136271.aD9bB291D.18521"
Content-Transfer-Encoding: 7bit


--15702136271.aD9bB291D.18521
Date: Fri, 4 Oct 2019 18:27:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110994

--- Comment #8 from Kimmo <sleijeri@gmail.com> ---
(In reply to Jason Playne from comment #2)
> This is has just started effecting me too. Playing "Hellblade: Senuas
> Sacrifice" on steam (so steam play / radv / dxvk)
>=20
> mesa via pkppa
>=20
> kernel 5.1.15-050115-generic (ubuntu kernel ppa)
> libdrm-amdgpu1:amd64                2.4.98+git1906260630.4
> mesa-vulkan-drivers:amd64           19.2~git1906240730.3b6
>=20
> this wasn't happening 2 days ago, now it happens consistantly

Distro: Arch linux with latest mesa/git/valve aco builds

Experiencing the same hangups with World of Warcraft / Lutris / radv /dxvk

mesa-aco-git 1:19.3.0_devel.115981.f2bed9b344c-1

Was using libdrm-2.4.99-1 stable build but dont know if there is any differ=
ence
to that. Installed just latest libdrm-git from valve-repository

Kernel 5.3.1-arch1-1-ARCH

Hardware: RX480 4GB

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15702136271.aD9bB291D.18521
Date: Fri, 4 Oct 2019 18:27:07 +0000
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
   title=3D"NEW - [vega10] *ERROR* Failed to initialize parser -125! , runn=
ing libreoffice"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110994#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [vega10] *ERROR* Failed to initialize parser -125! , runn=
ing libreoffice"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110994">bug 11099=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sleijeri&#64;gmail.com" title=3D"Kimmo &lt;sleijeri&#64;gmail.com&gt;"> <sp=
an class=3D"fn">Kimmo</span></a>
</span></b>
        <pre>(In reply to Jason Playne from <a href=3D"show_bug.cgi?id=3D11=
0994#c2">comment #2</a>)
<span class=3D"quote">&gt; This is has just started effecting me too. Playi=
ng &quot;Hellblade: Senuas
&gt; Sacrifice&quot; on steam (so steam play / radv / dxvk)
&gt;=20
&gt; mesa via pkppa
&gt;=20
&gt; kernel 5.1.15-050115-generic (ubuntu kernel ppa)
&gt; libdrm-amdgpu1:amd64                2.4.98+git1906260630.4
&gt; mesa-vulkan-drivers:amd64           19.2~git1906240730.3b6
&gt;=20
&gt; this wasn't happening 2 days ago, now it happens consistantly</span >

Distro: Arch linux with latest mesa/git/valve aco builds

Experiencing the same hangups with World of Warcraft / Lutris / radv /dxvk

mesa-aco-git 1:19.3.0_devel.115981.f2bed9b344c-1

Was using libdrm-2.4.99-1 stable build but dont know if there is any differ=
ence
to that. Installed just latest libdrm-git from valve-repository

Kernel 5.3.1-arch1-1-ARCH

Hardware: RX480 4GB</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15702136271.aD9bB291D.18521--

--===============0072817563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0072817563==--
