Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC4D4E6B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 11:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D6A6E43D;
	Sat, 12 Oct 2019 09:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67F526E471
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 09:06:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 64C207296E; Sat, 12 Oct 2019 09:06:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108771] [amdgpu] hang with The Last Story on the Dolphin emulator
Date: Sat, 12 Oct 2019 09:06:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: john.ettedgui@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108771-502-nyuN7lWbsw@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108771-502@http.bugs.freedesktop.org/>
References: <bug-108771-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1342019828=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1342019828==
Content-Type: multipart/alternative; boundary="15708712083.730818.21484"
Content-Transfer-Encoding: 7bit


--15708712083.730818.21484
Date: Sat, 12 Oct 2019 09:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108771

--- Comment #10 from John <john.ettedgui@gmail.com> ---
Christopher, in case you don't follow the gitlab issue, here's a copy of wh=
at I
wrote there:

I don't know if this is still an issue. I don't have any crash replaying the
trace anymore, and the save state I uploaded and saved on my system, was
actually not the right one so useless...

In that case I think it should be fine closing this, unless the others still
have this issue reproducible of course.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15708712083.730818.21484
Date: Sat, 12 Oct 2019 09:06:48 +0000
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
   title=3D"RESOLVED MOVED - [amdgpu] hang with The Last Story on the Dolph=
in emulator"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108771#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - [amdgpu] hang with The Last Story on the Dolph=
in emulator"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108771">bug 10877=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john.ettedgui&#64;gmail.com" title=3D"John &lt;john.ettedgui&#64;gmail.com&=
gt;"> <span class=3D"fn">John</span></a>
</span></b>
        <pre>Christopher, in case you don't follow the gitlab issue, here's=
 a copy of what I
wrote there:

I don't know if this is still an issue. I don't have any crash replaying the
trace anymore, and the save state I uploaded and saved on my system, was
actually not the right one so useless...

In that case I think it should be fine closing this, unless the others still
have this issue reproducible of course.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15708712083.730818.21484--

--===============1342019828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1342019828==--
