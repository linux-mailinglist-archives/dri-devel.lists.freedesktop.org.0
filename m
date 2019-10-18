Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD58ADC3B8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 13:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63316EB17;
	Fri, 18 Oct 2019 11:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B4776E0DF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:13:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 27C297296E; Fri, 18 Oct 2019 11:13:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 18 Oct 2019 11:13:40 +0000
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
Message-ID: <bug-111481-502-1axKikgbOO@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1243257860=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1243257860==
Content-Type: multipart/alternative; boundary="15713972200.4C2aC.29466"
Content-Transfer-Encoding: 7bit


--15713972200.4C2aC.29466
Date: Fri, 18 Oct 2019 11:13:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #105 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to kinovavi from comment #104)
> Are these bugs going to be fixed anytime soon? With much respect, this is
> insane. The card has been out for some 4 months now and it still isn=E2=
=80=99t
> usable for most on Linux. Yes, for some the patches at least let them bro=
wse
> firefox effectively, but for some it doesn=E2=80=99t. We=E2=80=99re Amd c=
ustomers like
> anyone else, support was supposed to be introduced on Mesa 19.2 and impro=
ved
> on Mesa 19.3, so far none of these two versions work properly. Please get
> your shit together Amd, this is ridiculous.

With all respect to you sir, calling names and aggressiveness isn't going to
fix any issues.
AMD team is aware of the issues, but debugging hangs that are hardly
reproducable or even random in some cases is very hard. Now I'm not entirely
defending AMD here, it is manufacturers' job to support the hardware if they
claim on the box that they do, however calling names isn't going to get
anything fixed.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15713972200.4C2aC.29466
Date: Fri, 18 Oct 2019 11:13:40 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c105">Comm=
ent # 105</a>
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
        <pre>(In reply to kinovavi from <a href=3D"show_bug.cgi?id=3D111481=
#c104">comment #104</a>)
<span class=3D"quote">&gt; Are these bugs going to be fixed anytime soon? W=
ith much respect, this is
&gt; insane. The card has been out for some 4 months now and it still isn=
=E2=80=99t
&gt; usable for most on Linux. Yes, for some the patches at least let them =
browse
&gt; firefox effectively, but for some it doesn=E2=80=99t. We=E2=80=99re Am=
d customers like
&gt; anyone else, support was supposed to be introduced on Mesa 19.2 and im=
proved
&gt; on Mesa 19.3, so far none of these two versions work properly. Please =
get
&gt; your shit together Amd, this is ridiculous.</span >

With all respect to you sir, calling names and aggressiveness isn't going to
fix any issues.
AMD team is aware of the issues, but debugging hangs that are hardly
reproducable or even random in some cases is very hard. Now I'm not entirely
defending AMD here, it is manufacturers' job to support the hardware if they
claim on the box that they do, however calling names isn't going to get
anything fixed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15713972200.4C2aC.29466--

--===============1243257860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1243257860==--
