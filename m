Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9301B28B31
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 22:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B97E89F5F;
	Thu, 23 May 2019 20:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39D5489F6B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 20:01:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3729F72167; Thu, 23 May 2019 20:01:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110701] GPU faults in in Unigine Valley 1.0
Date: Thu, 23 May 2019 20:01:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haagch@frickel.club
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110701-502-LI0e3sBbBn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110701-502@http.bugs.freedesktop.org/>
References: <bug-110701-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1113493697=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1113493697==
Content-Type: multipart/alternative; boundary="15586416932.C5Ad9.30152"
Content-Transfer-Encoding: 7bit


--15586416932.C5Ad9.30152
Date: Thu, 23 May 2019 20:01:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110701

--- Comment #25 from Christoph Haag <haagch@frickel.club> ---
(In reply to Yury Zhuravlev from comment #24)
> (In reply to Marek Ol=C5=A1=C3=A1k from comment #23)
> > Fixed by d6053bf2a170a0fec6d232fda097d2f35f0e9eae. Closing.
>=20
> The original issue was about Vega and on Vega we saw a different problem.=
 I
> suppose before close issue somebody should check patch on Vega.=20
> I will do it soon.

Since nobody responded: On a Vega 64 I got GPU faults like the ones posted =
here
followed by a GPU hang immediately when restoring a firefox (nightly) sessi=
on.
With mesa master this does not happen anymore.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586416932.C5Ad9.30152
Date: Thu, 23 May 2019 20:01:33 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701">bug 11070=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
haagch&#64;frickel.club" title=3D"Christoph Haag &lt;haagch&#64;frickel.clu=
b&gt;"> <span class=3D"fn">Christoph Haag</span></a>
</span></b>
        <pre>(In reply to Yury Zhuravlev from <a href=3D"show_bug.cgi?id=3D=
110701#c24">comment #24</a>)
<span class=3D"quote">&gt; (In reply to Marek Ol=C5=A1=C3=A1k from <a href=
=3D"show_bug.cgi?id=3D110701#c23">comment #23</a>)
&gt; &gt; Fixed by d6053bf2a170a0fec6d232fda097d2f35f0e9eae. Closing.
&gt;=20
&gt; The original issue was about Vega and on Vega we saw a different probl=
em. I
&gt; suppose before close issue somebody should check patch on Vega.=20
&gt; I will do it soon.</span >

Since nobody responded: On a Vega 64 I got GPU faults like the ones posted =
here
followed by a GPU hang immediately when restoring a firefox (nightly) sessi=
on.
With mesa master this does not happen anymore.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586416932.C5Ad9.30152--

--===============1113493697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1113493697==--
