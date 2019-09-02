Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A7AA5375
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9096D89623;
	Mon,  2 Sep 2019 09:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0546C89623
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:55:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F2150721AA; Mon,  2 Sep 2019 09:55:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111528] Using Fan-Control causes mmhub-pagefault and
 unresponsive system on Navi
Date: Mon, 02 Sep 2019 09:55:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111528-502-Xrtgdeoavq@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111528-502@http.bugs.freedesktop.org/>
References: <bug-111528-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1145505853=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1145505853==
Content-Type: multipart/alternative; boundary="15674181071.86faaB6.4387"
Content-Transfer-Encoding: 7bit


--15674181071.86faaB6.4387
Date: Mon, 2 Sep 2019 09:55:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111528

--- Comment #1 from Marko Popovic <popovic.marko@protonmail.com> ---
I can confirmed that using CoreCTRL did make my GPU quite unstable and
sometimes it would just lag for a few seconds and other times it would
completely crash the system until I rebooted.

The last time I observed this bug was when using Manjaro-gnome, Kernel 5.3 =
RC4
and MESA 19.3-git / LLVM10-git.

Haven't used CoreCTRL since because of the issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674181071.86faaB6.4387
Date: Mon, 2 Sep 2019 09:55:07 +0000
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
   title=3D"NEW - Using Fan-Control causes mmhub-pagefault and unresponsive=
 system on Navi"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111528#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Using Fan-Control causes mmhub-pagefault and unresponsive=
 system on Navi"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111528">bug 11152=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>I can confirmed that using CoreCTRL did make my GPU quite unst=
able and
sometimes it would just lag for a few seconds and other times it would
completely crash the system until I rebooted.

The last time I observed this bug was when using Manjaro-gnome, Kernel 5.3 =
RC4
and MESA 19.3-git / LLVM10-git.

Haven't used CoreCTRL since because of the issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674181071.86faaB6.4387--

--===============1145505853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1145505853==--
