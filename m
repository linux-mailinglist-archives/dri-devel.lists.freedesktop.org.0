Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0695B11A3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 17:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3044B6ED9E;
	Thu, 12 Sep 2019 15:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7056F6EDAB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 15:00:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6DBBA72167; Thu, 12 Sep 2019 15:00:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111527] obs-studio + latest mesa on amdgpu/vega64 leaks kernel
 memory rapidly
Date: Thu, 12 Sep 2019 15:00:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: tele42k3@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: blocked
Message-ID: <bug-111527-502-jZCN2xIbUd@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111527-502@http.bugs.freedesktop.org/>
References: <bug-111527-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2142452363=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2142452363==
Content-Type: multipart/alternative; boundary="15683004085.be9c.6357"
Content-Transfer-Encoding: 7bit


--15683004085.be9c.6357
Date: Thu, 12 Sep 2019 15:00:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111527

tele42k3@hotmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Blocks|                            |111444


Referenced Bugs:

https://bugs.freedesktop.org/show_bug.cgi?id=3D111444
[Bug 111444] [TRACKER] Mesa 19.2 release tracker
--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15683004085.be9c.6357
Date: Thu, 12 Sep 2019 15:00:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:tele42k3&=
#64;hotmail.com" title=3D"tele42k3&#64;hotmail.com">tele42k3&#64;hotmail.co=
m</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - obs-studio + latest mesa on amdgpu/vega64 leaks kernel me=
mory rapidly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111527">bug 11152=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Blocks</td>
           <td>
               &nbsp;
           </td>
           <td>111444
           </td>
         </tr></table>
      <p>
      </p>

        <div id=3D"referenced">
          <hr style=3D"border: 1px dashed #969696">
          <b>Referenced Bugs:</b>
          <ul>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [TRACKER] Mesa 19.2 release tracker"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111444">Bug 11144=
4</a>] [TRACKER] Mesa 19.2 release tracker
              </li>
          </ul>
        </div>
        <br>

      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15683004085.be9c.6357--

--===============2142452363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2142452363==--
