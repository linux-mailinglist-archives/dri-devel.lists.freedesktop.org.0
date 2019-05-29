Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906292E0AF
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 17:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7806E0EB;
	Wed, 29 May 2019 15:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BA826E2D2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 15:12:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2E9CD72167; Wed, 29 May 2019 15:12:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110658] MXGP3 (Steam, native Linux port, UE4): graphical glitches
Date: Wed, 29 May 2019 15:12:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mezin.alexander@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110658-502-oDeu14AxRY@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110658-502@http.bugs.freedesktop.org/>
References: <bug-110658-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1766914907=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1766914907==
Content-Type: multipart/alternative; boundary="15591427420.f88D3.28161"
Content-Transfer-Encoding: 7bit


--15591427420.f88D3.28161
Date: Wed, 29 May 2019 15:12:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110658

--- Comment #5 from Alexander Mezin <mezin.alexander@gmail.com> ---

(In reply to Timothy Arceri from comment #3)
> Are you able to test with llvm 9?

I won't have time for that until weekend

(In reply to Timothy Arceri from comment #4)
> I've run it on llvm 8 and mesa 19.0.5 and was unable to reproduce the iss=
ues
> seen in the screen capture on my Vega 64.

Just re-tested with mesa 19.0.5+llvm 8, the issue is still there.

It seems to be track-specific. At least it doesn't happen on "Compound", for
example.

Also the game runs fine under Proton/SteamPlay (no glitches/artifacts).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15591427420.f88D3.28161
Date: Wed, 29 May 2019 15:12:22 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - MXGP3 (Steam, native Linux port, UE4): graphical gli=
tches"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110658#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - MXGP3 (Steam, native Linux port, UE4): graphical gli=
tches"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110658">bug 11065=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mezin.alexander&#64;gmail.com" title=3D"Alexander Mezin &lt;mezin.alexander=
&#64;gmail.com&gt;"> <span class=3D"fn">Alexander Mezin</span></a>
</span></b>
        <pre>
(In reply to Timothy Arceri from <a href=3D"show_bug.cgi?id=3D110658#c3">co=
mment #3</a>)
<span class=3D"quote">&gt; Are you able to test with llvm 9?</span >

I won't have time for that until weekend

(In reply to Timothy Arceri from <a href=3D"show_bug.cgi?id=3D110658#c4">co=
mment #4</a>)
<span class=3D"quote">&gt; I've run it on llvm 8 and mesa 19.0.5 and was un=
able to reproduce the issues
&gt; seen in the screen capture on my Vega 64.</span >

Just re-tested with mesa 19.0.5+llvm 8, the issue is still there.

It seems to be track-specific. At least it doesn't happen on &quot;Compound=
&quot;, for
example.

Also the game runs fine under Proton/SteamPlay (no glitches/artifacts).</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15591427420.f88D3.28161--

--===============1766914907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1766914907==--
