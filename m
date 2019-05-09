Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E80183FB
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 05:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27196899F2;
	Thu,  9 May 2019 03:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8567899F2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 03:12:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A4E827215A; Thu,  9 May 2019 03:12:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110472] Graphical Fault (Desktop Freeze) on Specific OpenGL
 Application
Date: Thu, 09 May 2019 03:12:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gpizarro@javaman.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110472-502-aEcOYG92ZT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110472-502@http.bugs.freedesktop.org/>
References: <bug-110472-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0880272469=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0880272469==
Content-Type: multipart/alternative; boundary="15573715540.7B3d.23412"
Content-Transfer-Encoding: 7bit


--15573715540.7B3d.23412
Date: Thu, 9 May 2019 03:12:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110472

--- Comment #4 from gpizarro@javaman.net ---
(In reply to Timothy Arceri from comment #3)
> It would be helpful if you were able to get an apitrace [1] of the proble=
m.
>=20
> [1] https://github.com/apitrace/apitrace

Thank you for replying!

My apitrace file is unnaturally large (418MB) so I uploaded it to Google Dr=
ive
instead of this site. The apitrace log is also large (24MB), so it's also in
the shared folder.

Link:
https://drive.google.com/drive/folders/1rulVIW3dIB3RYA3RlIorLFufdQxLOYrn?us=
p=3Dsharing

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15573715540.7B3d.23412
Date: Thu, 9 May 2019 03:12:34 +0000
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
   title=3D"NEW - Graphical Fault (Desktop Freeze) on Specific OpenGL Appli=
cation"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110472#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphical Fault (Desktop Freeze) on Specific OpenGL Appli=
cation"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110472">bug 11047=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gpizarro&#64;javaman.net" title=3D"gpizarro&#64;javaman.net">gpizarro&#64;j=
avaman.net</a>
</span></b>
        <pre>(In reply to Timothy Arceri from <a href=3D"show_bug.cgi?id=3D=
110472#c3">comment #3</a>)
<span class=3D"quote">&gt; It would be helpful if you were able to get an a=
pitrace [1] of the problem.
&gt;=20
&gt; [1] <a href=3D"https://github.com/apitrace/apitrace">https://github.co=
m/apitrace/apitrace</a></span >

Thank you for replying!

My apitrace file is unnaturally large (418MB) so I uploaded it to Google Dr=
ive
instead of this site. The apitrace log is also large (24MB), so it's also in
the shared folder.

Link:
<a href=3D"https://drive.google.com/drive/folders/1rulVIW3dIB3RYA3RlIorLFuf=
dQxLOYrn?usp=3Dsharing">https://drive.google.com/drive/folders/1rulVIW3dIB3=
RYA3RlIorLFufdQxLOYrn?usp=3Dsharing</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15573715540.7B3d.23412--

--===============0880272469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0880272469==--
