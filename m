Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8859313424
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 21:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9417C89971;
	Fri,  3 May 2019 19:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 46D3189971
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 19:49:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3D8B17215A; Fri,  3 May 2019 19:49:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110443] vaapi/vpp: wrong output for non 64-bytes align width
 (ex: 1200)
Date: Fri, 03 May 2019 19:49:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: viktor_jaegerskuepper@freenet.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110443-502-QrnsG5mCAk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110443-502@http.bugs.freedesktop.org/>
References: <bug-110443-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0083370247=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0083370247==
Content-Type: multipart/alternative; boundary="15569129980.cC7E.7238"
Content-Transfer-Encoding: 7bit


--15569129980.cC7E.7238
Date: Fri, 3 May 2019 19:49:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110443

--- Comment #12 from Viktor J=C3=A4gersk=C3=BCpper <viktor_jaegerskuepper@f=
reenet.de> ---
I tested the commit in the merge request together with the r600-related cha=
nge
which has already been committed to the master branch, VLC doesn't crash any
more.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569129980.cC7E.7238
Date: Fri, 3 May 2019 19:49:58 +0000
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
   title=3D"NEW - vaapi/vpp: wrong output for non 64-bytes align width (ex:=
 1200)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110443#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vaapi/vpp: wrong output for non 64-bytes align width (ex:=
 1200)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110443">bug 11044=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
viktor_jaegerskuepper&#64;freenet.de" title=3D"Viktor J=C3=A4gersk=C3=BCppe=
r &lt;viktor_jaegerskuepper&#64;freenet.de&gt;"> <span class=3D"fn">Viktor =
J=C3=A4gersk=C3=BCpper</span></a>
</span></b>
        <pre>I tested the commit in the merge request together with the r60=
0-related change
which has already been committed to the master branch, VLC doesn't crash any
more.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569129980.cC7E.7238--

--===============0083370247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0083370247==--
