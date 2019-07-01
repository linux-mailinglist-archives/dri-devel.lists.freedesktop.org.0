Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62761424D
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2019 22:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F6689211;
	Sun,  5 May 2019 20:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4311689211
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 20:20:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3F8AF7215A; Sun,  5 May 2019 20:20:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Sun, 05 May 2019 20:20:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supercoolemail@seznam.cz
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108893-502-epFSZIleFk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108893-502@http.bugs.freedesktop.org/>
References: <bug-108893-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1462539132=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1462539132==
Content-Type: multipart/alternative; boundary="15570876131.bFcA8.1292"
Content-Transfer-Encoding: 7bit


--15570876131.bFcA8.1292
Date: Sun, 5 May 2019 20:20:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

--- Comment #15 from supercoolemail@seznam.cz ---
(In reply to andrew.m.mcmahon from comment #14)

> Or I can use softpipe which is even worse plus I get the laggy main menu:
> https://imgur.com/a/JwCnegN
Well, menu with softpipe is waay slower than RX 580 (which is slower than
llvmpipe - ~5 seconds per menu move vs. what feels instant; ~30 seconds with
softpipe).

> I'm sure you've already enabled 32 bit support in your distro:
Yes, and other 32-bit games work ok (except Sacred; and Fallout new Vegas is
not totally ok, but close enough, probably due to crappy engine).

> And installed all x64 and x86 Mesa related packages and firmware i.e:
Indeed. It should be good, because other 32-bit games work well (except
Sacred).

> Maybe you've exported some funny settings that you might have forgotten
Checked and my /etc/environment contains just distro-provided comments (not=
hing
else). I also don't have any relevant environment variables set (checked wi=
th
"set" command). I don't set environment variables globally unless it's
absolutely necessary, instead, I write scripts that set envvar using "env" =
and
that's it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15570876131.bFcA8.1292
Date: Sun, 5 May 2019 20:20:13 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
supercoolemail&#64;seznam.cz" title=3D"supercoolemail&#64;seznam.cz">superc=
oolemail&#64;seznam.cz</a>
</span></b>
        <pre>(In reply to andrew.m.mcmahon from <a href=3D"show_bug.cgi?id=
=3D108893#c14">comment #14</a>)

<span class=3D"quote">&gt; Or I can use softpipe which is even worse plus I=
 get the laggy main menu:
&gt; <a href=3D"https://imgur.com/a/JwCnegN">https://imgur.com/a/JwCnegN</a=
></span >
Well, menu with softpipe is waay slower than RX 580 (which is slower than
llvmpipe - ~5 seconds per menu move vs. what feels instant; ~30 seconds with
softpipe).

<span class=3D"quote">&gt; I'm sure you've already enabled 32 bit support i=
n your distro:</span >
Yes, and other 32-bit games work ok (except Sacred; and Fallout new Vegas is
not totally ok, but close enough, probably due to crappy engine).

<span class=3D"quote">&gt; And installed all x64 and x86 Mesa related packa=
ges and firmware i.e:</span >
Indeed. It should be good, because other 32-bit games work well (except
Sacred).

<span class=3D"quote">&gt; Maybe you've exported some funny settings that y=
ou might have forgotten</span >
Checked and my /etc/environment contains just distro-provided comments (not=
hing
else). I also don't have any relevant environment variables set (checked wi=
th
&quot;set&quot; command). I don't set environment variables globally unless=
 it's
absolutely necessary, instead, I write scripts that set envvar using &quot;=
env&quot; and
that's it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15570876131.bFcA8.1292--

--===============1462539132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1462539132==--
