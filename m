Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A592642D95
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 19:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DFE897E9;
	Wed, 12 Jun 2019 17:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5873A897E7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 17:33:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5524672167; Wed, 12 Jun 2019 17:33:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Wed, 12 Jun 2019 17:33:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cosiekvfj@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-x7Wx2Wt1M0@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0087749257=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0087749257==
Content-Type: multipart/alternative; boundary="15603608051.d153fd27B.6499"
Content-Transfer-Encoding: 7bit


--15603608051.d153fd27B.6499
Date: Wed, 12 Jun 2019 17:33:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #10 from cosiekvfj@o2.pl ---
>Was it looking similar? Was it solved for your case?

I didn't report that bug. Someone just wrote in that thread that HyperZ was=
 not
enabled due to lack of testing, so I ran some piglid tests. :)

I just want to warn you that there may be some more bugs in r300 driver. For
example: https://bugs.freedesktop.org/show_bug.cgi?id=3D98869 There was
workaround put in place to resolve this bug (So no proper fix for underlying
issue. See this mailing list conversation:
https://lists.freedesktop.org/archives/mesa-dev/2017-February/143980.html).=
 But
later I found out that after some upgrades game started crashing. But never
really figured out why. And didn't test it after that as I already finished
that game :)
https://bugs.freedesktop.org/show_bug.cgi?id=3D101382

I'm glad for your r300 work! :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603608051.d153fd27B.6499
Date: Wed, 12 Jun 2019 17:33:25 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cosiekvfj&#64;o2.pl" title=3D"cosiekvfj&#64;o2.pl">cosiekvfj&#64;o2.pl</a>
</span></b>
        <pre><span class=3D"quote">&gt;Was it looking similar? Was it solve=
d for your case?</span >

I didn't report that bug. Someone just wrote in that thread that HyperZ was=
 not
enabled due to lack of testing, so I ran some piglid tests. :)

I just want to warn you that there may be some more bugs in r300 driver. For
example: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Electronic Super Joy graphic artefacts (regres=
sion,bisected)"
   href=3D"show_bug.cgi?id=3D98869">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D98869</a> There was
workaround put in place to resolve this bug (So no proper fix for underlying
issue. See this mailing list conversation:
<a href=3D"https://lists.freedesktop.org/archives/mesa-dev/2017-February/14=
3980.html">https://lists.freedesktop.org/archives/mesa-dev/2017-February/14=
3980.html</a>). But
later I found out that after some upgrades game started crashing. But never
really figured out why. And didn't test it after that as I already finished
that game :)
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [r300] Electronic super joy crash on startup(regression)"
   href=3D"show_bug.cgi?id=3D101382">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D101382</a>

I'm glad for your r300 work! :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603608051.d153fd27B.6499--

--===============0087749257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0087749257==--
