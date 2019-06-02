Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2EF322B1
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 10:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCBB899BC;
	Sun,  2 Jun 2019 08:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA32A899BC
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 08:14:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B6D2E72167; Sun,  2 Jun 2019 08:14:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110803] Coruption and flickering on polaris with mesa 19.0.5
Date: Sun, 02 Jun 2019 08:14:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: crab2313@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-110803-502-jbORL4WWFL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110803-502@http.bugs.freedesktop.org/>
References: <bug-110803-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1413221588=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1413221588==
Content-Type: multipart/alternative; boundary="15594632411.DeC7bE.27142"
Content-Transfer-Encoding: 7bit


--15594632411.DeC7bE.27142
Date: Sun, 2 Jun 2019 08:14:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110803

crab2313@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |crab2313@gmail.com

--- Comment #2 from crab2313@gmail.com ---
Created attachment 144408
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144408&action=3Dedit
picture of visual studio code

I have noticed the problem on all of my machines with an polaris AMD card.=
=20

RX 580
hades canyon

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15594632411.DeC7bE.27142
Date: Sun, 2 Jun 2019 08:14:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:crab2313&=
#64;gmail.com" title=3D"crab2313&#64;gmail.com">crab2313&#64;gmail.com</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Coruption and flickering on polaris with mesa 19.0.5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110803">bug 11080=
3</a>
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
           <td>crab2313&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Coruption and flickering on polaris with mesa 19.0.5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110803#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Coruption and flickering on polaris with mesa 19.0.5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110803">bug 11080=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
crab2313&#64;gmail.com" title=3D"crab2313&#64;gmail.com">crab2313&#64;gmail=
.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144408=
" name=3D"attach_144408" title=3D"picture of visual studio code">attachment=
 144408</a> <a href=3D"attachment.cgi?id=3D144408&amp;action=3Dedit" title=
=3D"picture of visual studio code">[details]</a></span>
picture of visual studio code

I have noticed the problem on all of my machines with an polaris AMD card.=
=20

RX 580
hades canyon</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15594632411.DeC7bE.27142--

--===============1413221588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1413221588==--
