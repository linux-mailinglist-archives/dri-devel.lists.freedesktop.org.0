Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B551EF122
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 09:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BD18941E;
	Tue, 30 Apr 2019 07:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 46BF389444
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 07:19:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4051A72158; Tue, 30 Apr 2019 07:19:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Tue, 30 Apr 2019 07:19:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-jsEaEhC7oY@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109345-502@http.bugs.freedesktop.org/>
References: <bug-109345-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0620545781=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0620545781==
Content-Type: multipart/alternative; boundary="15566087491.a7A5.3025"
Content-Transfer-Encoding: 7bit


--15566087491.a7A5.3025
Date: Tue, 30 Apr 2019 07:19:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #14 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
(In reply to Michel D=C3=A4nzer from comment #13)
> (In reply to Christian Zigotzky from comment #12)
> > Any news? The issue still exists with the kernel 5.1-RC7.
>=20
> I wouldn't expect anything to happen without the result of git bisect.

Hi Michel,

This is a bug report from an enduser. Endusers aren't able to git bisect. T=
hey
use the distributions for their daily work. I don't have these graphics car=
ds
so I can't bisect it ether. The user told you what the problem is and we
figured out that the DRM updates 'drm-next-2018-12-14' [1] are the problem.

If you don't try to solve it then we will lost this support. PLEASE check y=
our
code more carefully before you release it. There are a lot of endusers who =
uses
this code in they daily work later.

I will also look in the DRM updates deeper but I work for an enduser first
level support so I need a lot of time to understand the code. It's really
better you look in the DRM changes because you understand this code better =
than
me.=20

Thanks,
Christian

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D4971f090aa7f6ce5daa094ce4334f6618f93a7eb

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15566087491.a7A5.3025
Date: Tue, 30 Apr 2019 07:19:09 +0000
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
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>(In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?i=
d=3D109345#c13">comment #13</a>)
<span class=3D"quote">&gt; (In reply to Christian Zigotzky from <a href=3D"=
show_bug.cgi?id=3D109345#c12">comment #12</a>)
&gt; &gt; Any news? The issue still exists with the kernel 5.1-RC7.
&gt;=20
&gt; I wouldn't expect anything to happen without the result of git bisect.=
</span >

Hi Michel,

This is a bug report from an enduser. Endusers aren't able to git bisect. T=
hey
use the distributions for their daily work. I don't have these graphics car=
ds
so I can't bisect it ether. The user told you what the problem is and we
figured out that the DRM updates 'drm-next-2018-12-14' [1] are the problem.

If you don't try to solve it then we will lost this support. PLEASE check y=
our
code more carefully before you release it. There are a lot of endusers who =
uses
this code in they daily work later.

I will also look in the DRM updates deeper but I work for an enduser first
level support so I need a lot of time to understand the code. It's really
better you look in the DRM changes because you understand this code better =
than
me.=20

Thanks,
Christian

[1]
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D4971f090aa7f6ce5daa094ce4334f6618f93a7eb">https://git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D4971f090aa7f=
6ce5daa094ce4334f6618f93a7eb</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15566087491.a7A5.3025--

--===============0620545781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0620545781==--
