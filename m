Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A3E3AEAC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 07:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8655890E9;
	Mon, 10 Jun 2019 05:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6569890E9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 05:43:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C31E572167; Mon, 10 Jun 2019 05:43:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110313] [CI][SHARDS] igt@kms_lease@lease-uevent - fail - Failed
 assertion: igt_lease_change_detected(uevent_monitor, 1)
Date: Mon, 10 Jun 2019 05:43:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lakshminarayana.vudum@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: low
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: priority
Message-ID: <bug-110313-502-04MxErmL2b@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110313-502@http.bugs.freedesktop.org/>
References: <bug-110313-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0611137149=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0611137149==
Content-Type: multipart/alternative; boundary="15601453851.8EccD2666.26317"
Content-Transfer-Encoding: 7bit


--15601453851.8EccD2666.26317
Date: Mon, 10 Jun 2019 05:43:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110313

Lakshmi <lakshminarayana.vudum@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|high                        |low

--- Comment #6 from Lakshmi <lakshminarayana.vudum@intel.com> ---
(In reply to Mika Kahola from comment #5)
> It seems that we haven't seen this bug for a while now. Can we close this
> one?

This issue occurred only once CI_DRM_5855_full (2 months, 1 week old). We c=
an
close this issue if this failure doesn't appear in the the next 3 weeks.

Dropping the priority to Low as the reproduction rate is very low.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15601453851.8EccD2666.26317
Date: Mon, 10 Jun 2019 05:43:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:lakshmina=
rayana.vudum&#64;intel.com" title=3D"Lakshmi &lt;lakshminarayana.vudum&#64;=
intel.com&gt;"> <span class=3D"fn">Lakshmi</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][SHARDS] igt&#64;kms_lease&#64;lease-uevent - fail - =
Failed assertion: igt_lease_change_detected(uevent_monitor, 1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110313">bug 11031=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>high
           </td>
           <td>low
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][SHARDS] igt&#64;kms_lease&#64;lease-uevent - fail - =
Failed assertion: igt_lease_change_detected(uevent_monitor, 1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110313#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][SHARDS] igt&#64;kms_lease&#64;lease-uevent - fail - =
Failed assertion: igt_lease_change_detected(uevent_monitor, 1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110313">bug 11031=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lakshminarayana.vudum&#64;intel.com" title=3D"Lakshmi &lt;lakshminarayana.v=
udum&#64;intel.com&gt;"> <span class=3D"fn">Lakshmi</span></a>
</span></b>
        <pre>(In reply to Mika Kahola from <a href=3D"show_bug.cgi?id=3D110=
313#c5">comment #5</a>)
<span class=3D"quote">&gt; It seems that we haven't seen this bug for a whi=
le now. Can we close this
&gt; one?</span >

This issue occurred only once CI_DRM_5855_full (2 months, 1 week old). We c=
an
close this issue if this failure doesn't appear in the the next 3 weeks.

Dropping the priority to Low as the reproduction rate is very low.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15601453851.8EccD2666.26317--

--===============0611137149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0611137149==--
