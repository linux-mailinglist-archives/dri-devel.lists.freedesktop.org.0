Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DBA39848
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 00:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD8D89183;
	Fri,  7 Jun 2019 22:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDF6F89189
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 22:10:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DA22D72167; Fri,  7 Jun 2019 22:10:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109887] vega56 undervolting/overclocking voltage issues
Date: Fri, 07 Jun 2019 22:10:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jrdoane@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109887-502-nNBaXFjSTc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109887-502@http.bugs.freedesktop.org/>
References: <bug-109887-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0404855727=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0404855727==
Content-Type: multipart/alternative; boundary="15599454223.b36b.23010"
Content-Transfer-Encoding: 7bit


--15599454223.b36b.23010
Date: Fri, 7 Jun 2019 22:10:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109887

--- Comment #6 from Jon Doane <jrdoane@gmail.com> ---
I'm also having this particular issue with a Vega 64. It appears that setti=
ng
any non-stock voltage to any of the power states will cause the voltage at =
any
clock to jump to 1.20v. I haven't been able to find a way around it yet.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599454223.b36b.23010
Date: Fri, 7 Jun 2019 22:10:22 +0000
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
   title=3D"NEW - vega56 undervolting/overclocking voltage issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vega56 undervolting/overclocking voltage issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887">bug 10988=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jrdoane&#64;gmail.com" title=3D"Jon Doane &lt;jrdoane&#64;gmail.com&gt;"> <=
span class=3D"fn">Jon Doane</span></a>
</span></b>
        <pre>I'm also having this particular issue with a Vega 64. It appea=
rs that setting
any non-stock voltage to any of the power states will cause the voltage at =
any
clock to jump to 1.20v. I haven't been able to find a way around it yet.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599454223.b36b.23010--

--===============0404855727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0404855727==--
