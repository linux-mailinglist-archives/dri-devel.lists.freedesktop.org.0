Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4CD341EC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 10:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CE289830;
	Tue,  4 Jun 2019 08:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3236189830
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 08:34:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2B73372167; Tue,  4 Jun 2019 08:34:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] booting with kernel version 5.1.0 or higher on RX 580
 hangs
Date: Tue, 04 Jun 2019 08:34:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: gobinda.joy@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-7marQ2G77X@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110822-502@http.bugs.freedesktop.org/>
References: <bug-110822-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0767637736=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0767637736==
Content-Type: multipart/alternative; boundary="15596372951.8BF4.30825"
Content-Transfer-Encoding: 7bit


--15596372951.8BF4.30825
Date: Tue, 4 Jun 2019 08:34:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #5 from Gobinda Joy <gobinda.joy@gmail.com> ---
(In reply to Alex Deucher from comment #4)
> (In reply to Gobinda Joy from comment #3)
> > I was curious so checked out the commit log on amd-staging-drm-next bra=
nch.
> > And I see some reverts of powerplay related commits.
> >=20
> > Link: https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-staging-dr=
m-next
> >=20
> > I am currently waiting for this to getting merged with master branch.
>=20
> Those were just reverts of changes that were accidentally committed just
> before.  Can you bisect?
Help/instruct me on how to do it. I can compile kernel and use git. But I n=
ever
have used bisect command.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596372951.8BF4.30825
Date: Tue, 4 Jun 2019 08:34:55 +0000
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
   title=3D"NEW - booting with kernel version 5.1.0 or higher on RX 580 han=
gs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - booting with kernel version 5.1.0 or higher on RX 580 han=
gs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gobinda.joy&#64;gmail.com" title=3D"Gobinda Joy &lt;gobinda.joy&#64;gmail.c=
om&gt;"> <span class=3D"fn">Gobinda Joy</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
0822#c4">comment #4</a>)
<span class=3D"quote">&gt; (In reply to Gobinda Joy from <a href=3D"show_bu=
g.cgi?id=3D110822#c3">comment #3</a>)
&gt; &gt; I was curious so checked out the commit log on amd-staging-drm-ne=
xt branch.
&gt; &gt; And I see some reverts of powerplay related commits.
&gt; &gt;=20
&gt; &gt; Link: <a href=3D"https://cgit.freedesktop.org/~agd5f/linux/log/?h=
=3Damd-staging-drm-next">https://cgit.freedesktop.org/~agd5f/linux/log/?h=
=3Damd-staging-drm-next</a>
&gt; &gt;=20
&gt; &gt; I am currently waiting for this to getting merged with master bra=
nch.
&gt;=20
&gt; Those were just reverts of changes that were accidentally committed ju=
st
&gt; before.  Can you bisect?</span >
Help/instruct me on how to do it. I can compile kernel and use git. But I n=
ever
have used bisect command.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596372951.8BF4.30825--

--===============0767637736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0767637736==--
