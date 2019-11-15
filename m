Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AEFFE71F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 22:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C006C6E7F1;
	Fri, 15 Nov 2019 21:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 767416EB1E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 21:22:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 73083720E2; Fri, 15 Nov 2019 21:22:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112266] [Navi] Pathfinder: Kingmaker is causing a GPU hang:
 flip_done timed out error
Date: Fri, 15 Nov 2019 21:22:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rly@hotmail.hu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112266-502-cXmcNHAWAn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112266-502@http.bugs.freedesktop.org/>
References: <bug-112266-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1526496224=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1526496224==
Content-Type: multipart/alternative; boundary="15738529232.bAc4cCDBc.15962"
Content-Transfer-Encoding: 7bit


--15738529232.bAc4cCDBc.15962
Date: Fri, 15 Nov 2019 21:22:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112266

--- Comment #8 from rLy <rly@hotmail.hu> ---
(In reply to Alex Deucher from comment #6)
> Created attachment 145971 [details] [review]
> possible fix
>=20
> Does this patch help?

I tried it as well on 5.4-rc7 and fixed every game I mentioned(CS:GO, SOTTR,
TS2020, KSP).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15738529232.bAc4cCDBc.15962
Date: Fri, 15 Nov 2019 21:22:03 +0000
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
   title=3D"NEW - [Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_=
done timed out error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112266#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_=
done timed out error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112266">bug 11226=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rly&#64;hotmail.hu" title=3D"rLy &lt;rly&#64;hotmail.hu&gt;"> <span class=
=3D"fn">rLy</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
2266#c6">comment #6</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145971" name=3D"attach_145971" title=3D"possible fix">attachment 14=
5971</a> <a href=3D"attachment.cgi?id=3D145971&amp;action=3Dedit" title=3D"=
possible fix">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&a=
mp;bug=3D112266&amp;attachment=3D145971'>[review]</a> [review]
&gt; possible fix
&gt;=20
&gt; Does this patch help?</span >

I tried it as well on 5.4-rc7 and fixed every game I mentioned(CS:GO, SOTTR,
TS2020, KSP).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15738529232.bAc4cCDBc.15962--

--===============1526496224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1526496224==--
