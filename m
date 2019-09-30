Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E9C1BC1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 08:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E776E366;
	Mon, 30 Sep 2019 06:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2753B6E365
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 06:51:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7E8D0729CB; Mon, 30 Sep 2019 01:56:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111858] [ICL] IGT tests kms_ccs and kms_frontbuffer_tracking
 fail on latest drm-tip kernel
Date: Mon, 30 Sep 2019 01:56:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: yue.he@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111858-502-4pGE756v8A@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111858-502@http.bugs.freedesktop.org/>
References: <bug-111858-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0056304082=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0056304082==
Content-Type: multipart/alternative; boundary="15698085991.679DF1.3145"
Content-Transfer-Encoding: 7bit


--15698085991.679DF1.3145
Date: Mon, 30 Sep 2019 01:56:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111858

--- Comment #1 from HeYue <yue.he@intel.com> ---
Created attachment 145586
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145586&action=3Dedit
kms_ccs

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698085991.679DF1.3145
Date: Mon, 30 Sep 2019 01:56:39 +0000
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
   title=3D"NEW - [ICL] IGT tests kms_ccs and kms_frontbuffer_tracking fail=
 on latest drm-tip kernel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111858#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [ICL] IGT tests kms_ccs and kms_frontbuffer_tracking fail=
 on latest drm-tip kernel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111858">bug 11185=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yue.he&#64;intel.com" title=3D"HeYue &lt;yue.he&#64;intel.com&gt;"> <span c=
lass=3D"fn">HeYue</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145586=
" name=3D"attach_145586" title=3D"kms_ccs">attachment 145586</a> <a href=3D=
"attachment.cgi?id=3D145586&amp;action=3Dedit" title=3D"kms_ccs">[details]<=
/a></span>
kms_ccs</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698085991.679DF1.3145--

--===============0056304082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0056304082==--
