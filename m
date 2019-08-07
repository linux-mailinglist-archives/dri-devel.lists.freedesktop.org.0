Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69256846EC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 10:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F84A6E695;
	Wed,  7 Aug 2019 08:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E3DD6E695
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 08:15:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7B04D72167; Wed,  7 Aug 2019 08:15:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110214] Raven Ridge (2400G): xterm scrollback buffer disappears
 while Shift+PgUp and Shift+PgDn
Date: Wed, 07 Aug 2019 08:15:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110214-502-zGs8nDK1u2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110214-502@http.bugs.freedesktop.org/>
References: <bug-110214-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1365404280=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1365404280==
Content-Type: multipart/alternative; boundary="15651657232.3bDf35b.32560"
Content-Transfer-Encoding: 7bit


--15651657232.3bDf35b.32560
Date: Wed, 7 Aug 2019 08:15:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110214

--- Comment #104 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-praye=
r@amd.com> ---
(In reply to Diego Viola from comment #103)
> (In reply to Pierre-Eric Pelloux-Prayer from comment #102)
> > (In reply to Diego Viola from comment #100)
> > > (In reply to Michel D=C3=A4nzer from comment #99)
> > > > https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1554 has so=
me fixes
> > > > for DPBB, might help for this as well.
> > >=20
> > > Unfortunately it doesn't help, I compiled mesa to /usr/local (from his
> > > dpbb_fixes branch) but the issue is still there.
> >=20
> > I just pushed a new commit on the same MR
> > (https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1554/
> > diffs?commit_id=3Dd25df1274ea48fa73b0d8b31558e2cebb0851015).
> >=20
> > Could you test on your machine and let me know if it helps?
>=20
> I can confirm that your new commit fixes the problem. Thank you very much=
! :D

Thanks for the confirmation.
I added a Tested-by tag to the commit.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15651657232.3bDf35b.32560
Date: Wed, 7 Aug 2019 08:15:23 +0000
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
   title=3D"NEW - Raven Ridge (2400G): xterm scrollback buffer disappears w=
hile Shift+PgUp and Shift+PgDn"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110214#c104">Comm=
ent # 104</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Raven Ridge (2400G): xterm scrollback buffer disappears w=
hile Shift+PgUp and Shift+PgDn"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110214">bug 11021=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>(In reply to Diego Viola from <a href=3D"show_bug.cgi?id=3D110=
214#c103">comment #103</a>)
<span class=3D"quote">&gt; (In reply to Pierre-Eric Pelloux-Prayer from <a =
href=3D"show_bug.cgi?id=3D110214#c102">comment #102</a>)
&gt; &gt; (In reply to Diego Viola from <a href=3D"show_bug.cgi?id=3D110214=
#c100">comment #100</a>)
&gt; &gt; &gt; (In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi=
?id=3D110214#c99">comment #99</a>)
&gt; &gt; &gt; &gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/mer=
ge_requests/1554">https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1=
554</a> has some fixes
&gt; &gt; &gt; &gt; for DPBB, might help for this as well.
&gt; &gt; &gt;=20
&gt; &gt; &gt; Unfortunately it doesn't help, I compiled mesa to /usr/local=
 (from his
&gt; &gt; &gt; dpbb_fixes branch) but the issue is still there.
&gt; &gt;=20
&gt; &gt; I just pushed a new commit on the same MR
&gt; &gt; (<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_reques=
ts/1554/">https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1554/</a>
&gt; &gt; diffs?commit_id=3Dd25df1274ea48fa73b0d8b31558e2cebb0851015).
&gt; &gt;=20
&gt; &gt; Could you test on your machine and let me know if it helps?
&gt;=20
&gt; I can confirm that your new commit fixes the problem. Thank you very m=
uch! :D</span >

Thanks for the confirmation.
I added a Tested-by tag to the commit.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15651657232.3bDf35b.32560--

--===============1365404280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1365404280==--
