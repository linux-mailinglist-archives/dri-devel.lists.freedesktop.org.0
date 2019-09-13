Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800DB17E1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 07:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F63F6EE77;
	Fri, 13 Sep 2019 05:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1150A6EE7C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 05:22:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D8B4072168; Fri, 13 Sep 2019 05:22:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 13 Sep 2019 05:22:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: b747xx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-ytmKyYnzPz@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1486364170=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1486364170==
Content-Type: multipart/alternative; boundary="15683521661.F4AA9d849.24147"
Content-Transfer-Encoding: 7bit


--15683521661.F4AA9d849.24147
Date: Fri, 13 Sep 2019 05:22:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #38 from Mathieu Belanger <b747xx@gmail.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #33)
> Created attachment 145323 [details] [review]
> wip patch
>=20
> You can give a try to the attached kernel patch which hopefully could
> prevent some sdma timeouts.
>=20
> I'm still testing it but the more testers the better :)

So far so good. Your patch seam to have fixed the "random" crash That I was
able to replicate when I was loading my 3 many tabs browsers and phpstorm in
the same time and I can use my IDE without crashing too.

Maybe I got really lucky too. But it's been more than a day without crash a=
nd
without the nodma "fix"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15683521661.F4AA9d849.24147
Date: Fri, 13 Sep 2019 05:22:46 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c38">Comme=
nt # 38</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
b747xx&#64;gmail.com" title=3D"Mathieu Belanger &lt;b747xx&#64;gmail.com&gt=
;"> <span class=3D"fn">Mathieu Belanger</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D111481#c33">comment #33</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145323" name=3D"attach_145323" title=3D"wip patch">attachment 14532=
3</a> <a href=3D"attachment.cgi?id=3D145323&amp;action=3Dedit" title=3D"wip=
 patch">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=
=3D111481&amp;attachment=3D145323'>[review]</a> [review]
&gt; wip patch
&gt;=20
&gt; You can give a try to the attached kernel patch which hopefully could
&gt; prevent some sdma timeouts.
&gt;=20
&gt; I'm still testing it but the more testers the better :)</span >

So far so good. Your patch seam to have fixed the &quot;random&quot; crash =
That I was
able to replicate when I was loading my 3 many tabs browsers and phpstorm in
the same time and I can use my IDE without crashing too.

Maybe I got really lucky too. But it's been more than a day without crash a=
nd
without the nodma &quot;fix&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15683521661.F4AA9d849.24147--

--===============1486364170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1486364170==--
