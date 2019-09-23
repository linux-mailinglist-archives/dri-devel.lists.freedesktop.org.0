Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06013BAE3C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 09:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05B6E133;
	Mon, 23 Sep 2019 07:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0500E6E131
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 07:00:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EFC6972162; Mon, 23 Sep 2019 07:00:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Mon, 23 Sep 2019 07:00:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: daniel.lawrence.lu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-wmLPbH2fTR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1838323852=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1838323852==
Content-Type: multipart/alternative; boundary="15692220540.Ec78E951.29770"
Content-Transfer-Encoding: 7bit


--15692220540.Ec78E951.29770
Date: Mon, 23 Sep 2019 07:00:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #4 from Daniel Lu <daniel.lawrence.lu@gmail.com> ---
I am seeing a similar hang in Starcraft II. Unlike Marko, I am not using d9=
vk
--- instead, I'm using wine-nine. The hang doesn't happen in all games but
seems to be particularly frequent in the coop mission "dead of night".

Using mesa-git 19.3.0_devel.115092.3f5b541fc8b-1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15692220540.Ec78E951.29770
Date: Mon, 23 Sep 2019 07:00:54 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
daniel.lawrence.lu&#64;gmail.com" title=3D"Daniel Lu &lt;daniel.lawrence.lu=
&#64;gmail.com&gt;"> <span class=3D"fn">Daniel Lu</span></a>
</span></b>
        <pre>I am seeing a similar hang in Starcraft II. Unlike Marko, I am=
 not using d9vk
--- instead, I'm using wine-nine. The hang doesn't happen in all games but
seems to be particularly frequent in the coop mission &quot;dead of night&q=
uot;.

Using mesa-git 19.3.0_devel.115092.3f5b541fc8b-1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15692220540.Ec78E951.29770--

--===============1838323852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1838323852==--
