Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0A7D68E1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 19:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11306E58A;
	Mon, 14 Oct 2019 17:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B9276E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 17:54:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3FD8C7296E; Mon, 14 Oct 2019 17:54:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111986] 5700 XT hangs entire system in games
Date: Mon, 14 Oct 2019 17:54:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: danielsuarez369@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111986-502-op2Uy5nHEa@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111986-502@http.bugs.freedesktop.org/>
References: <bug-111986-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0830395432=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0830395432==
Content-Type: multipart/alternative; boundary="15710756550.9fF6.24688"
Content-Transfer-Encoding: 7bit


--15710756550.9fF6.24688
Date: Mon, 14 Oct 2019 17:54:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111986

--- Comment #8 from Daniel Suarez <danielsuarez369@protonmail.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #7)
> Thanks for your bug report.
>=20
> It would be really helpful to have the content of dmesg when your system
> hangs.
> You can get it from another computer using ssh or you could extract it fr=
om
> /var/log/dmesg* files after a reboot.
>=20
> You can also check some of the existing bugs and see if they are the same=
 as
> yours:
> - https://bugs.freedesktop.org/show_bug.cgi?id=3D111986
> - https://bugzilla.kernel.org/show_bug.cgi?id=3D205169

Thank you so much for taking the time to reply to my bug report, I really
wanted to provide that but unfortunately it doesn't exist, I even did "ls -=
ls
/var/log/" to make sure it wasn't dolphin hiding the file, but a dmesg
file/folder doesn't exist. Closest thing I see is "Xorg.0.log.old" which I =
will
attach just incase=20

As for bug report 205169, I do not believe so since my system hangs regardl=
ess
if a game or application is fullscreen or not.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15710756550.9fF6.24688
Date: Mon, 14 Oct 2019 17:54:15 +0000
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
   title=3D"NEW - 5700 XT hangs entire system in games"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111986#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 5700 XT hangs entire system in games"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111986">bug 11198=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
danielsuarez369&#64;protonmail.com" title=3D"Daniel Suarez &lt;danielsuarez=
369&#64;protonmail.com&gt;"> <span class=3D"fn">Daniel Suarez</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D111986#c7">comment #7</a>)
<span class=3D"quote">&gt; Thanks for your bug report.
&gt;=20
&gt; It would be really helpful to have the content of dmesg when your syst=
em
&gt; hangs.
&gt; You can get it from another computer using ssh or you could extract it=
 from
&gt; /var/log/dmesg* files after a reboot.
&gt;=20
&gt; You can also check some of the existing bugs and see if they are the s=
ame as
&gt; yours:
&gt; - <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 5700 XT hangs entire system in games"
   href=3D"show_bug.cgi?id=3D111986">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111986</a>
&gt; - <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D205169">htt=
ps://bugzilla.kernel.org/show_bug.cgi?id=3D205169</a></span >

Thank you so much for taking the time to reply to my bug report, I really
wanted to provide that but unfortunately it doesn't exist, I even did &quot=
;ls -ls
/var/log/&quot; to make sure it wasn't dolphin hiding the file, but a dmesg
file/folder doesn't exist. Closest thing I see is &quot;Xorg.0.log.old&quot=
; which I will
attach just incase=20

As for bug report 205169, I do not believe so since my system hangs regardl=
ess
if a game or application is fullscreen or not.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15710756550.9fF6.24688--

--===============0830395432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0830395432==--
