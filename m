Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D755618A60
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 15:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE4F89C83;
	Thu,  9 May 2019 13:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B1B889C83
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 13:13:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3744D7215A; Thu,  9 May 2019 13:13:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110381] Failed to updateMST allocation table forpipe idx:0
Date: Thu, 09 May 2019 13:13:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110381-502-GuNeFdAyll@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110381-502@http.bugs.freedesktop.org/>
References: <bug-110381-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1679859496=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1679859496==
Content-Type: multipart/alternative; boundary="15574075892.aAE5F914.13546"
Content-Transfer-Encoding: 7bit


--15574075892.aAE5F914.13546
Date: Thu, 9 May 2019 13:13:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110381

--- Comment #5 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
(In reply to Paul Menzel from comment #4)
> (In reply to Nicholas Kazlauskas from comment #3)
> > We're able to reproduce the problem.
> >=20
> > I believe that we found the issue was caused by the new common helper D=
RM
> > for DP MST hotplug. A fix is in the works for this issue.
>=20
> Great news! Thank you for the update.
>=20
> Is there another bug report this should be merged with?

Not that I'm aware of at least - I think this was the first user report for=
 the
issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574075892.aAE5F914.13546
Date: Thu, 9 May 2019 13:13:09 +0000
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
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381">bug 11038=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicholas.kazlauskas&#64;amd.com" title=3D"Nicholas Kazlauskas &lt;nicholas.=
kazlauskas&#64;amd.com&gt;"> <span class=3D"fn">Nicholas Kazlauskas</span><=
/a>
</span></b>
        <pre>(In reply to Paul Menzel from <a href=3D"show_bug.cgi?id=3D110=
381#c4">comment #4</a>)
<span class=3D"quote">&gt; (In reply to Nicholas Kazlauskas from <a href=3D=
"show_bug.cgi?id=3D110381#c3">comment #3</a>)
&gt; &gt; We're able to reproduce the problem.
&gt; &gt;=20
&gt; &gt; I believe that we found the issue was caused by the new common he=
lper DRM
&gt; &gt; for DP MST hotplug. A fix is in the works for this issue.
&gt;=20
&gt; Great news! Thank you for the update.
&gt;=20
&gt; Is there another bug report this should be merged with?</span >

Not that I'm aware of at least - I think this was the first user report for=
 the
issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574075892.aAE5F914.13546--

--===============1679859496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1679859496==--
