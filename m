Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F16314F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 08:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3F888E4B;
	Tue,  9 Jul 2019 06:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4056B88E79
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 06:59:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3730D72167; Tue,  9 Jul 2019 06:59:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111087] SteamOS boots to black screen
Date: Tue, 09 Jul 2019 06:59:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ludovico.denittis@collabora.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111087-502-YSty4qAkea@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111087-502@http.bugs.freedesktop.org/>
References: <bug-111087-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1933205646=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1933205646==
Content-Type: multipart/alternative; boundary="15626555600.eDE8CBA.27434"
Content-Transfer-Encoding: 7bit


--15626555600.eDE8CBA.27434
Date: Tue, 9 Jul 2019 06:59:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111087

--- Comment #14 from Ludovico de Nittis <ludovico.denittis@collabora.com> -=
--
(In reply to Michel D=C3=A4nzer from comment #12)
> Sounds like Xorg keeps crashing, please attach the Xorg.0.log.old file.

Yes apparently Xorg keeps rebooting. In the latest Xorg.0.log.old file that=
 I
attached the entry "Server terminated successfully (0)" is at [44.281], whi=
le
the Xorg.0.log (like the one already attached) was starting right after it =
at
[44.565].

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15626555600.eDE8CBA.27434
Date: Tue, 9 Jul 2019 06:59:20 +0000
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
   title=3D"NEW - SteamOS boots to black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111087#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - SteamOS boots to black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111087">bug 11108=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ludovico.denittis&#64;collabora.com" title=3D"Ludovico de Nittis &lt;ludovi=
co.denittis&#64;collabora.com&gt;"> <span class=3D"fn">Ludovico de Nittis</=
span></a>
</span></b>
        <pre>(In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?i=
d=3D111087#c12">comment #12</a>)
<span class=3D"quote">&gt; Sounds like Xorg keeps crashing, please attach t=
he Xorg.0.log.old file.</span >

Yes apparently Xorg keeps rebooting. In the latest Xorg.0.log.old file that=
 I
attached the entry &quot;Server terminated successfully (0)&quot; is at [44=
.281], while
the Xorg.0.log (like the one already attached) was starting right after it =
at
[44.565].</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15626555600.eDE8CBA.27434--

--===============1933205646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1933205646==--
