Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC03E080F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 17:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5686E86A;
	Tue, 22 Oct 2019 15:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3391E6E86A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 15:57:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 30806720E2; Tue, 22 Oct 2019 15:57:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 22 Oct 2019 15:57:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-GZXAkdDWsL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1418879643=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1418879643==
Content-Type: multipart/alternative; boundary="15717598243.dCB7547E.31262"
Content-Transfer-Encoding: 7bit


--15717598243.dCB7547E.31262
Date: Tue, 22 Oct 2019 15:57:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #122 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to bugs from comment #121)
> I have the same problem using archlinux. I tried mesa+llvm stable
> (19.2/9.0), the git-versions with amdgpu and even with plain modesetting.=
 I
> have random freezes with xfce (with and without compositor) and nearly
> immediatly freezes with Rise of the Tomb Raider. "Freezing" means X11, Ma=
gic
> SysRQ and SSH still works.
> I had to remove the card because the computer was competely unusable with=
 4
> freezes in 15 minutes. So I can't provide you with more information, sorr=
y.
> But if I can give you any information without putting the card back into =
the
> computer (the slot has suffered a bit...) I am here.
>=20
> Now I found this bug report and wonder, why it is 8 weeks old, still "new"
> and unassigned and severity is not set. In my opinion a freezing computer=
 is
> really critical!=20


I kinda wonder that myself. I set it to critical and AMD dev removed the tag
critical so they apparently disagree that not being able to use your hardwa=
re
is a critical bug (thinking).

+ Bug is present on all systems running LVVM9 and MESA 19.2+... Ubuntu too.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15717598243.dCB7547E.31262
Date: Tue, 22 Oct 2019 15:57:04 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c122">Comm=
ent # 122</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to bugs from <a href=3D"show_bug.cgi?id=3D111481#c12=
1">comment #121</a>)
<span class=3D"quote">&gt; I have the same problem using archlinux. I tried=
 mesa+llvm stable
&gt; (19.2/9.0), the git-versions with amdgpu and even with plain modesetti=
ng. I
&gt; have random freezes with xfce (with and without compositor) and nearly
&gt; immediatly freezes with Rise of the Tomb Raider. &quot;Freezing&quot; =
means X11, Magic
&gt; SysRQ and SSH still works.
&gt; I had to remove the card because the computer was competely unusable w=
ith 4
&gt; freezes in 15 minutes. So I can't provide you with more information, s=
orry.
&gt; But if I can give you any information without putting the card back in=
to the
&gt; computer (the slot has suffered a bit...) I am here.
&gt;=20
&gt; Now I found this bug report and wonder, why it is 8 weeks old, still &=
quot;new&quot;
&gt; and unassigned and severity is not set. In my opinion a freezing compu=
ter is
&gt; really critical! </span >


I kinda wonder that myself. I set it to critical and AMD dev removed the tag
critical so they apparently disagree that not being able to use your hardwa=
re
is a critical bug (thinking).

+ Bug is present on all systems running LVVM9 and MESA 19.2+... Ubuntu too.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15717598243.dCB7547E.31262--

--===============1418879643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1418879643==--
