Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C8975F1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 11:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E156E2A9;
	Wed, 21 Aug 2019 09:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4BF06E941
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 09:21:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B100072161; Wed, 21 Aug 2019 09:21:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Wed, 21 Aug 2019 09:21:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: briancschott@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111122-502-pFFDpugUSy@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111122-502@http.bugs.freedesktop.org/>
References: <bug-111122-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1131480712=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1131480712==
Content-Type: multipart/alternative; boundary="15663793013.D8f1.19824"
Content-Transfer-Encoding: 7bit


--15663793013.D8f1.19824
Date: Wed, 21 Aug 2019 09:21:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #23 from Brian Schott <briancschott@gmail.com> ---
(In reply to Marek Ol=C5=A1=C3=A1k from comment #22)
> How do I reproduce the Xfce hang and corruption? It's not reproducible wi=
th
> Ubuntu 16.04.

How old is XFCE in 16.04? I'm using 4.14, which was released this month.=20

Here's a quote from the release notes: "The window manager received a slew =
of
updates and features, including support for VSync (using either Present or
OpenGL as backend) to reduce or remove display flickering, HiDPI support,
improved GLX support with NVIDIA proprietary/closed source drivers, support=
 for
XInput2, various compositor improvements and a new default theme." Maybe ol=
der
versions of the window manager don't trigger the issue.

Either way, I have an extra SSD on the way. I should be able to swap that i=
n to
the machine and figure out some directions for reproducing the bug from a c=
lean
install.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15663793013.D8f1.19824
Date: Wed, 21 Aug 2019 09:21:41 +0000
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
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
briancschott&#64;gmail.com" title=3D"Brian Schott &lt;briancschott&#64;gmai=
l.com&gt;"> <span class=3D"fn">Brian Schott</span></a>
</span></b>
        <pre>(In reply to Marek Ol=C5=A1=C3=A1k from <a href=3D"show_bug.cg=
i?id=3D111122#c22">comment #22</a>)
<span class=3D"quote">&gt; How do I reproduce the Xfce hang and corruption?=
 It's not reproducible with
&gt; Ubuntu 16.04.</span >

How old is XFCE in 16.04? I'm using 4.14, which was released this month.=20

Here's a quote from the release notes: &quot;The window manager received a =
slew of
updates and features, including support for VSync (using either Present or
OpenGL as backend) to reduce or remove display flickering, HiDPI support,
improved GLX support with NVIDIA proprietary/closed source drivers, support=
 for
XInput2, various compositor improvements and a new default theme.&quot; May=
be older
versions of the window manager don't trigger the issue.

Either way, I have an extra SSD on the way. I should be able to swap that i=
n to
the machine and figure out some directions for reproducing the bug from a c=
lean
install.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15663793013.D8f1.19824--

--===============1131480712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1131480712==--
