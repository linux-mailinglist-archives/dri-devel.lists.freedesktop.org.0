Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C618AA5C4C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 20:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ECB891C2;
	Mon,  2 Sep 2019 18:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 844C8891CB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 18:34:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7F97572161; Mon,  2 Sep 2019 18:34:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111524] AMD A9 R5 GPU doesn't work after resume
Date: Mon, 02 Sep 2019 18:34:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: samuel@sieb.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111524-502-6VF097WKuh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111524-502@http.bugs.freedesktop.org/>
References: <bug-111524-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2000409413=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2000409413==
Content-Type: multipart/alternative; boundary="15674492972.abc9BD.1089"
Content-Transfer-Encoding: 7bit


--15674492972.abc9BD.1089
Date: Mon, 2 Sep 2019 18:34:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111524

--- Comment #5 from Samuel Sieb <samuel@sieb.net> ---
Created attachment 145236
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145236&action=3Dedit
dmesg with drm.debug=3D4

I've seen mention elsewhere about setting the drm.debug value.  If you need=
 a
different setting, let me know.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674492972.abc9BD.1089
Date: Mon, 2 Sep 2019 18:34:57 +0000
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
   title=3D"NEW - AMD A9 R5 GPU doesn't work after resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111524#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD A9 R5 GPU doesn't work after resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111524">bug 11152=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
samuel&#64;sieb.net" title=3D"Samuel Sieb &lt;samuel&#64;sieb.net&gt;"> <sp=
an class=3D"fn">Samuel Sieb</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145236=
" name=3D"attach_145236" title=3D"dmesg with drm.debug=3D4">attachment 1452=
36</a> <a href=3D"attachment.cgi?id=3D145236&amp;action=3Dedit" title=3D"dm=
esg with drm.debug=3D4">[details]</a></span>
dmesg with drm.debug=3D4

I've seen mention elsewhere about setting the drm.debug value.  If you need=
 a
different setting, let me know.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674492972.abc9BD.1089--

--===============2000409413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2000409413==--
