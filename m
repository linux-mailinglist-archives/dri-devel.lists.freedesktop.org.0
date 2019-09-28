Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC4C108F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 12:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B406E0FD;
	Sat, 28 Sep 2019 10:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9DAE86E0FD
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 10:14:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9645B72162; Sat, 28 Sep 2019 10:14:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Sat, 28 Sep 2019 10:14:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leon@tutanota.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-CGkTwMe6d1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1120888945=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1120888945==
Content-Type: multipart/alternative; boundary="15696656480.C428.8237"
Content-Transfer-Encoding: 7bit


--15696656480.C428.8237
Date: Sat, 28 Sep 2019 10:14:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #22 from Leon <leon@tutanota.de> ---
(In reply to Andrew Sheldon from comment #20)
> (In reply to Leon from comment #19)
> > By the way, since I have a x470 mb, it cannot be related to PCI express=
 4.0.
> > It's also not related to dual displays, since I'm running just one.
>=20
> Not necessarily. Some x370 and x470 motherboards erroneously reported PCIE
> 4.0 support in earlier BIOS (AGESA) updates. You might want to update to =
the
> latest available bios, if that is the case with your board.
>=20
> Although, since you are using 5.3.1 I don't think the bug has been fixed =
in
> mainline 5.3 yet. You might want to use amd-staging-drm-next, or wait for
> 4.1-rc1.

Already did even before installing the 5700 XT. Running bios P3.60 with AM4
1.0.0.3 ABB AGESA.

Thanks for the kernel suggestion though!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696656480.C428.8237
Date: Sat, 28 Sep 2019 10:14:08 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
leon&#64;tutanota.de" title=3D"Leon &lt;leon&#64;tutanota.de&gt;"> <span cl=
ass=3D"fn">Leon</span></a>
</span></b>
        <pre>(In reply to Andrew Sheldon from <a href=3D"show_bug.cgi?id=3D=
111482#c20">comment #20</a>)
<span class=3D"quote">&gt; (In reply to Leon from <a href=3D"show_bug.cgi?i=
d=3D111482#c19">comment #19</a>)
&gt; &gt; By the way, since I have a x470 mb, it cannot be related to PCI e=
xpress 4.0.
&gt; &gt; It's also not related to dual displays, since I'm running just on=
e.
&gt;=20
&gt; Not necessarily. Some x370 and x470 motherboards erroneously reported =
PCIE
&gt; 4.0 support in earlier BIOS (AGESA) updates. You might want to update =
to the
&gt; latest available bios, if that is the case with your board.
&gt;=20
&gt; Although, since you are using 5.3.1 I don't think the bug has been fix=
ed in
&gt; mainline 5.3 yet. You might want to use amd-staging-drm-next, or wait =
for
&gt; 4.1-rc1.</span >

Already did even before installing the 5700 XT. Running bios P3.60 with AM4
1.0.0.3 ABB AGESA.

Thanks for the kernel suggestion though!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696656480.C428.8237--

--===============1120888945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1120888945==--
