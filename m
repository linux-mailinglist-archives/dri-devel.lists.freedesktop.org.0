Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695FFBAE2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 22:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC77A6EE7C;
	Wed, 13 Nov 2019 21:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 197F16EE79
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 21:33:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 15C50720E2; Wed, 13 Nov 2019 21:33:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112265] Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no
 graphics
Date: Wed, 13 Nov 2019 21:33:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: John.p.donnelly@oracle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-112265-502-B2l5iRMXDK@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112265-502@http.bugs.freedesktop.org/>
References: <bug-112265-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0336857292=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0336857292==
Content-Type: multipart/alternative; boundary="15736808180.DC95DB486.18261"
Content-Transfer-Encoding: 7bit


--15736808180.DC95DB486.18261
Date: Wed, 13 Nov 2019 21:33:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112265

John.p.donnelly@oracle.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |John.p.donnelly@oracle.com

--- Comment #1 from John.p.donnelly@oracle.com ---
Created attachment 145949
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145949&action=3Dedit
dmesg and message file on bi-sected kernel

Starting gnome=20

See messages for=20

  " starting gnome "

  and=20

"  Stopping gnome "

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15736808180.DC95DB486.18261
Date: Wed, 13 Nov 2019 21:33:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:John.p.do=
nnelly&#64;oracle.com" title=3D"John.p.donnelly&#64;oracle.com">John.p.donn=
elly&#64;oracle.com</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no gra=
phics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112265">bug 11226=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>John.p.donnelly&#64;oracle.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no gra=
phics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112265#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no gra=
phics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112265">bug 11226=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
John.p.donnelly&#64;oracle.com" title=3D"John.p.donnelly&#64;oracle.com">Jo=
hn.p.donnelly&#64;oracle.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145949=
" name=3D"attach_145949" title=3D"dmesg and message file on bi-sected kerne=
l">attachment 145949</a> <a href=3D"attachment.cgi?id=3D145949&amp;action=
=3Dedit" title=3D"dmesg and message file on bi-sected kernel">[details]</a>=
</span>
dmesg and message file on bi-sected kernel

Starting gnome=20

See messages for=20

  &quot; starting gnome &quot;

  and=20

&quot;  Stopping gnome &quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15736808180.DC95DB486.18261--

--===============0336857292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0336857292==--
