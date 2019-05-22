Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B12654A
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 15:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B77389AA7;
	Wed, 22 May 2019 13:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A1DF889AA7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 13:57:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9C76472167; Wed, 22 May 2019 13:57:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110721] graphics corruption on steam client with mesa 19.1.0
 rc3 on polaris
Date: Wed, 22 May 2019 13:57:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fdo-bugs@engestrom.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110721-502-FvlzjRGFya@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110721-502@http.bugs.freedesktop.org/>
References: <bug-110721-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1991634126=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1991634126==
Content-Type: multipart/alternative; boundary="15585334790.d541153f.31582"
Content-Transfer-Encoding: 7bit


--15585334790.d541153f.31582
Date: Wed, 22 May 2019 13:57:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110721

--- Comment #3 from Eric Engestrom <fdo-bugs@engestrom.ch> ---
(In reply to alvarex from comment #2)
> now the bug has hit 19.0.5.

Are you saying the bug was not present in 19.0.4, but is now present in 19.=
0.5?

If so, that's only 22 new commits, 10 if you exclude obvious non-candidates.

If you can reliably test this, that's at most 5 build & test you need to do
when bisecting mesa-19.0.4..mesa-19.0.5; could you do this please? It would
greatly help figure out the cause :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15585334790.d541153f.31582
Date: Wed, 22 May 2019 13:57:59 +0000
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
   title=3D"NEW - graphics corruption on steam client with mesa 19.1.0 rc3 =
on polaris"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110721#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - graphics corruption on steam client with mesa 19.1.0 rc3 =
on polaris"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110721">bug 11072=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fdo-bugs&#64;engestrom.ch" title=3D"Eric Engestrom &lt;fdo-bugs&#64;engestr=
om.ch&gt;"> <span class=3D"fn">Eric Engestrom</span></a>
</span></b>
        <pre>(In reply to alvarex from <a href=3D"show_bug.cgi?id=3D110721#=
c2">comment #2</a>)
<span class=3D"quote">&gt; now the bug has hit 19.0.5.</span >

Are you saying the bug was not present in 19.0.4, but is now present in 19.=
0.5?

If so, that's only 22 new commits, 10 if you exclude obvious non-candidates.

If you can reliably test this, that's at most 5 build &amp; test you need t=
o do
when bisecting mesa-19.0.4..mesa-19.0.5; could you do this please? It would
greatly help figure out the cause :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15585334790.d541153f.31582--

--===============1991634126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1991634126==--
