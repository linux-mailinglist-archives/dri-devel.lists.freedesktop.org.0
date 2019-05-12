Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF41AE2F
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 23:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E582C89308;
	Sun, 12 May 2019 21:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C9318930B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 21:00:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 88DD9721CD; Sun, 12 May 2019 21:00:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109692] deadlock occurs during GPU reset
Date: Sun, 12 May 2019 21:00:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-109692-502-esSpRKpVT0@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109692-502@http.bugs.freedesktop.org/>
References: <bug-109692-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0960389507=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0960389507==
Content-Type: multipart/alternative; boundary="15576948223.4B95C80d.8433"
Content-Transfer-Encoding: 7bit


--15576948223.4B95C80d.8433
Date: Sun, 12 May 2019 21:00:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109692

--- Comment #43 from mikhail.v.gavrilov@gmail.com ---
Created attachment 144242
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144242&action=3Dedit
dmesg of another GPU reset issue

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15576948223.4B95C80d.8433
Date: Sun, 12 May 2019 21:00:22 +0000
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
   title=3D"NEW - deadlock occurs during GPU reset"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109692#c43">Comme=
nt # 43</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - deadlock occurs during GPU reset"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109692">bug 10969=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mikhail.v.gavrilov&#64;gmail.com" title=3D"mikhail.v.gavrilov&#64;gmail.com=
">mikhail.v.gavrilov&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144242=
" name=3D"attach_144242" title=3D"dmesg of another GPU reset issue">attachm=
ent 144242</a> <a href=3D"attachment.cgi?id=3D144242&amp;action=3Dedit" tit=
le=3D"dmesg of another GPU reset issue">[details]</a></span>
dmesg of another GPU reset issue</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15576948223.4B95C80d.8433--

--===============0960389507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0960389507==--
