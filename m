Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 812D61BDAB
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 21:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534758920E;
	Mon, 13 May 2019 19:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A810E891D2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 19:22:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A4B26721CD; Mon, 13 May 2019 19:22:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110671] Regression: DP outputs out of sync on dual-DP tiled 5k
 screen
Date: Mon, 13 May 2019 19:22:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugs@bzatek.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-110671-502-ZMswbfdRl2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110671-502@http.bugs.freedesktop.org/>
References: <bug-110671-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0312316080=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0312316080==
Content-Type: multipart/alternative; boundary="15577753340.2FbfF.7260"
Content-Transfer-Encoding: 7bit


--15577753340.2FbfF.7260
Date: Mon, 13 May 2019 19:22:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110671

Tomas Bzatek <bugs@bzatek.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugs@bzatek.net

--- Comment #2 from Tomas Bzatek <bugs@bzatek.net> ---
Created attachment 144250
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144250&action=3Dedit
dmesg drm.debug=3D0x1e (kernel 5.1.0-rc5-g9d6fea5744d6)

This is drm-next-5.2 branch, head 9d6fea5744d6798353f
"drm/amdgpu/psp: move psp version specific function pointers to early_init"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15577753340.2FbfF.7260
Date: Mon, 13 May 2019 19:22:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:bugs&#64;=
bzatek.net" title=3D"Tomas Bzatek &lt;bugs&#64;bzatek.net&gt;"> <span class=
=3D"fn">Tomas Bzatek</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Regression: DP outputs out of sync on dual-DP tiled 5k sc=
reen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110671">bug 11067=
1</a>
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
           <td>bugs&#64;bzatek.net
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Regression: DP outputs out of sync on dual-DP tiled 5k sc=
reen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110671#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Regression: DP outputs out of sync on dual-DP tiled 5k sc=
reen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110671">bug 11067=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bugs&#64;bzatek.net" title=3D"Tomas Bzatek &lt;bugs&#64;bzatek.net&gt;"> <s=
pan class=3D"fn">Tomas Bzatek</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144250=
" name=3D"attach_144250" title=3D"dmesg drm.debug=3D0x1e (kernel 5.1.0-rc5-=
g9d6fea5744d6)">attachment 144250</a> <a href=3D"attachment.cgi?id=3D144250=
&amp;action=3Dedit" title=3D"dmesg drm.debug=3D0x1e (kernel 5.1.0-rc5-g9d6f=
ea5744d6)">[details]</a></span>
dmesg drm.debug=3D0x1e (kernel 5.1.0-rc5-g9d6fea5744d6)

This is drm-next-5.2 branch, head 9d6fea5744d6798353f
&quot;drm/amdgpu/psp: move psp version specific function pointers to early_=
init&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15577753340.2FbfF.7260--

--===============0312316080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0312316080==--
