Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12F18988
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 14:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DA989722;
	Thu,  9 May 2019 12:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C69789722
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 12:16:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6929F7215A; Thu,  9 May 2019 12:16:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109294] [CI][SHARDS] igt@prime_vgem@basic-fence-flip - skip -
 Test requirement: (crtc_id = set_fb_on_crtc(i915, 0, &bo[0], fb_id[0])), SKIP
Date: Thu, 09 May 2019 12:16:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tvrtko.ursulin@linux.intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: lowest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-109294-502-kHUMB7X6Lz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109294-502@http.bugs.freedesktop.org/>
References: <bug-109294-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1074779360=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1074779360==
Content-Type: multipart/alternative; boundary="15574041802.9AB52ead6.4707"
Content-Transfer-Encoding: 7bit


--15574041802.9AB52ead6.4707
Date: Thu, 9 May 2019 12:16:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109294

Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #9 from Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> ---
Pushed a test fix to probe the native display resolution.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574041802.9AB52ead6.4707
Date: Thu, 9 May 2019 12:16:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:tvrtko.ur=
sulin&#64;linux.intel.com" title=3D"Tvrtko Ursulin &lt;tvrtko.ursulin&#64;l=
inux.intel.com&gt;"> <span class=3D"fn">Tvrtko Ursulin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS] igt&#64;prime_vgem&#64;basic-fenc=
e-flip - skip - Test requirement: (crtc_id =3D set_fb_on_crtc(i915, 0, &amp=
;bo[0], fb_id[0])), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109294">bug 10929=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>REOPENED
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS] igt&#64;prime_vgem&#64;basic-fenc=
e-flip - skip - Test requirement: (crtc_id =3D set_fb_on_crtc(i915, 0, &amp=
;bo[0], fb_id[0])), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109294#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS] igt&#64;prime_vgem&#64;basic-fenc=
e-flip - skip - Test requirement: (crtc_id =3D set_fb_on_crtc(i915, 0, &amp=
;bo[0], fb_id[0])), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109294">bug 10929=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tvrtko.ursulin&#64;linux.intel.com" title=3D"Tvrtko Ursulin &lt;tvrtko.ursu=
lin&#64;linux.intel.com&gt;"> <span class=3D"fn">Tvrtko Ursulin</span></a>
</span></b>
        <pre>Pushed a test fix to probe the native display resolution.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574041802.9AB52ead6.4707--

--===============1074779360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1074779360==--
