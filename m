Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B55602FF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 11:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422496E456;
	Fri,  5 Jul 2019 09:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABF736E456
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 09:18:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E2ABA72168; Fri,  5 Jul 2019 09:18:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111060] Dying Light does start but doesnt render properly.
Date: Fri, 05 Jul 2019 09:18:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTOURBUG
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111060-502-02nJNgCA1r@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111060-502@http.bugs.freedesktop.org/>
References: <bug-111060-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1710128050=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1710128050==
Content-Type: multipart/alternative; boundary="15623182871.Ef127.10079"
Content-Transfer-Encoding: 7bit


--15623182871.Ef127.10079
Date: Fri, 5 Jul 2019 09:18:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111060

--- Comment #6 from Haxk20 <haxk612@gmail.com> ---
(In reply to Timothy Arceri from comment #4)
> The crash on Arch Linux is due to a game bug not a Mesa bug which is boug=
ht
> to light by Arch using libglvnd, basically the game doesn't check for
> features it uses correctly.
>=20
> Recent patches have landed in git that implement the functions Dying Light
> tries to use and users have reported that this fixes the start-up crash. I
> suggest you make sure your system is correctly picking up the version of
> Mesa you have built from git and is not continuing to use your system copy
> of Mesa.
>=20
> Either way this in not actually a Mesa bug so I'm going to close this bug
> report. If you really are correctly using the copy of Mesa you built from
> git and it is still crashing I suggest waiting a little longer until full
> support for the EXT_direct_state_access extension lands in Mesa.

I just opened the 00-mesa file and set the variables manually for dying lig=
ht
and the game launches just OK and works as expected.
How can i check which file is overwritting the variables ?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15623182871.Ef127.10079
Date: Fri, 5 Jul 2019 09:18:07 +0000
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
   title=3D"RESOLVED NOTOURBUG - Dying Light does start but doesnt render p=
roperly."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111060#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Dying Light does start but doesnt render p=
roperly."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111060">bug 11106=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
haxk612&#64;gmail.com" title=3D"Haxk20 &lt;haxk612&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Haxk20</span></a>
</span></b>
        <pre>(In reply to Timothy Arceri from <a href=3D"show_bug.cgi?id=3D=
111060#c4">comment #4</a>)
<span class=3D"quote">&gt; The crash on Arch Linux is due to a game bug not=
 a Mesa bug which is bought
&gt; to light by Arch using libglvnd, basically the game doesn't check for
&gt; features it uses correctly.
&gt;=20
&gt; Recent patches have landed in git that implement the functions Dying L=
ight
&gt; tries to use and users have reported that this fixes the start-up cras=
h. I
&gt; suggest you make sure your system is correctly picking up the version =
of
&gt; Mesa you have built from git and is not continuing to use your system =
copy
&gt; of Mesa.
&gt;=20
&gt; Either way this in not actually a Mesa bug so I'm going to close this =
bug
&gt; report. If you really are correctly using the copy of Mesa you built f=
rom
&gt; git and it is still crashing I suggest waiting a little longer until f=
ull
&gt; support for the EXT_direct_state_access extension lands in Mesa.</span=
 >

I just opened the 00-mesa file and set the variables manually for dying lig=
ht
and the game launches just OK and works as expected.
How can i check which file is overwritting the variables ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15623182871.Ef127.10079--

--===============1710128050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1710128050==--
