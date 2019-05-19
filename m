Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 180FD225B8
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 04:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE3A890BC;
	Sun, 19 May 2019 02:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F44989363
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 02:38:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9A41872167; Sun, 19 May 2019 02:38:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105251] [Vega10]  GPU lockup on boot: VMC page fault
Date: Sun, 19 May 2019 02:38:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: mesa@suchmail.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105251-502-xFr4coyO0Y@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105251-502@http.bugs.freedesktop.org/>
References: <bug-105251-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1713088326=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1713088326==
Content-Type: multipart/alternative; boundary="15582334967.6D78B.19023"
Content-Transfer-Encoding: 7bit


--15582334967.6D78B.19023
Date: Sun, 19 May 2019 02:38:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105251

--- Comment #66 from CheatCodesOfLife <mesa@suchmail.net> ---
I jumped ship to nvidia months ago so this doesn't help me, but for you guys
following this thread, the Cemu developers managed to fix this issue on the=
ir
end.

If you install the latest public release of Cemu, all games will work with =
Vega
+ mesa under wine.

Since there are non-cemu cases in here, I won't close the issue (someone el=
se
can if appropriate).

I'm unsubscribing from this now.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15582334967.6D78B.19023
Date: Sun, 19 May 2019 02:38:16 +0000
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
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251#c66">Comme=
nt # 66</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251">bug 10525=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mesa&#64;suchmail.net" title=3D"CheatCodesOfLife &lt;mesa&#64;suchmail.net&=
gt;"> <span class=3D"fn">CheatCodesOfLife</span></a>
</span></b>
        <pre>I jumped ship to nvidia months ago so this doesn't help me, bu=
t for you guys
following this thread, the Cemu developers managed to fix this issue on the=
ir
end.

If you install the latest public release of Cemu, all games will work with =
Vega
+ mesa under wine.

Since there are non-cemu cases in here, I won't close the issue (someone el=
se
can if appropriate).

I'm unsubscribing from this now.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15582334967.6D78B.19023--

--===============1713088326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1713088326==--
