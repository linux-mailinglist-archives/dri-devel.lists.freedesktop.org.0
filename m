Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9BE92B128
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 09:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FEC10E497;
	Tue,  9 Jul 2024 07:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chickenguard.com header.i=@chickenguard.com header.b="VDm2vU0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1201 seconds by postgrey-1.36 at gabe;
 Mon, 08 Jul 2024 23:12:53 UTC
Received: from mta-174-84-113.intercom.com.sparkpostmail.com
 (mta-174-84-113.intercom.com.sparkpostmail.com [192.174.84.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110E610E108
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 23:12:52 +0000 (UTC)
X-MSFBL: mV8s0GWuvBud5gKEOD/ULCjdh/BY2CXptKb67q4ZXfU=|eyJ0ZW5hbnRfaWQiOiJ
 pbnRlcmNvbSIsImN1c3RvbWVyX2lkIjoiMSIsIm1lc3NhZ2VfaWQiOiI2Njg4YmY
 2ZDhjNjY2MDU5NTdlOSIsInN1YmFjY291bnRfaWQiOiIzNTMwMTgiLCJyIjoiZHJ
 pLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chickenguard.com;
 s=intercom; t=1720479167; i=@chickenguard.com;
 bh=SdDQ1VJ0kq0aJiii5XzUvrcCZ5PsO4bLVlKQnk8L5ck=;
 h=To:Content-Type:Subject:From:Date:Message-ID:Cc:From:To:Cc:
 Subject;
 b=VDm2vU0wf53p5nIddOi6kwOac25iGJ7200iwhp9mxStBF7q3vHDOT3Gi1o8d/Wf3g
 GqFAis+9Ok1nU/Gs+eRkVLa2A3F84JOCMkrBBXcguhLXH15+8rfqb/Re+tnIYfQI0v
 8QH0SUWor6XHDMvdgF8q5EqncvmDWXV372s/Mfpo=
To: felix.kuehling@amd.com
Content-Type: multipart/alternative;
 boundary="_----BeoNQayvnox3IlxY9j8yiA===_4D/75-09702-FBD6C866"
MIME-Version: 1.0
Subject: =?utf-8?B?UmU6IFJlOiBbQ1JJVV0gUmXvvJpQcm9wb3NhbCB0byBhZGQgQ1JJ?=
 =?utf-8?B?VSBzdXBwb3J0IHRvIERSTSByZW5kZXIgbm9kZXM=?=
From: "Chip (Support Bot) from ChickenGuard" <customercare@chickenguard.com>
References: <dcbcff5e11b787a2f913b5fc5f7f694c904fe441@intercom>
 <29cab8f8-a544-4e5c-a87c-b7f4c31a1a64@amd.com>
Date: Mon, 08 Jul 2024 22:52:47 +0000
X-Intercom-App-Id: mnjgb56x
X-Intercom-Comment-Id: 21910046954
X-Intercom-Notification-Reason: support_email
X-Intercom-Bin: proven_users
X-Auto-Response-Suppress: OOF, AutoReply
Message-ID: <5ebd34a0-479eddd9-1720479167-157432@outbound.intercom.chickenguard.com>
X-Report-Abuse: Please report spam or abuse to abuse@intercom.io
X-Intercom-Source: workflow
In-Reply-To: <29cab8f8-a544-4e5c-a87c-b7f4c31a1a64@amd.com>
X-Mailgun-Variables: {"app_id":"mnjgb56x", "conversation_id":"157432",
 "intercom_message_id":2292006748, "user_id":"668c6da71d8e3b3b6ca6851c"}
Cc: riyue.zcm@alibaba-inc.com, tursulin@ursulin.net,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 airlied@redhat.com, daniel@ffwll.ch
X-Mailman-Approved-At: Tue, 09 Jul 2024 07:34:10 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Reply-To: "Chip \(Support Bot\) from ChickenGuard"
 <customercare@chickenguard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_----BeoNQayvnox3IlxY9j8yiA===_4D/75-09702-FBD6C866
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

Hi Felix, 
 Thank you for your email. It has been received and a member of the team will be in contact as soon as possible. We are usually able to respond to queries within 1-2 working days. 
 (If not already given, please let us know your full name, order number, and purchase date to aid us in supporting you efficiently.) 
 In the meantime, please feel free to explore our help centre to see if there is already an answer to your question. 
 https://help.chickenguard.com/en/ 
 Kind regards,
--_----BeoNQayvnox3IlxY9j8yiA===_4D/75-09702-FBD6C866
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="UTF-8"

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html style="background-color: #fff;">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta name="viewport" content="width=device-width">
<meta name="format-detection" content="telephone=no">
<!-- Resets -->

<style type="text/css" data-premailer="ignore">
  #outlook a{
    padding: 0;
  }
  body{
    -webkit-text-size-adjust: none;
    -ms-text-size-adjust: none;
    font-weight: 400;
  }
  .ReadMsgBody{
    width: 100%;
  }
  .ExternalClass{
    width: 100%;
  }
  img {
    border: 0;
    max-width: 100%;
    height: auto;
    outline: none;
    display: inline-block;
    margin: 0;
    padding: 0;
    text-decoration: none;
    line-height: 100%;
  }
  #backgroundTable{
    height: 100% !important;
    margin: 0;
    padding: 0;
    width: 100% !important;
  }
</style>
<!-- Main styles -->

<style type="text/css">
  /**
   * Generic
   */

  html {
    background-color: #fff;
  }

  .main {
    font-family: Helvetica, Arial, sans-serif;
    letter-spacing: 0;
    width: 100%;
  }

  table {
    border-spacing: 0;
    border-collapse: separate;
    table-layout: fixed;
  }

  td {
    padding: 0;
    font-family: Helvetica, Arial, sans-serif;
  }

  a {
    border: none;
    outline: none !important;
  }


  /**
   * Content
   */

  .content-td {
    line-height: 20px;
    font-size: 14px;
  }

  .content-td .article-card,
  .content-td .intercom-interblocks-link-content-container {
    max-width: 500px;
    border: 1px solid #e0e0e0;
    border-radius: 2px;
    padding: 0;
    margin-bottom: 15px;
  }

  .content-td .article-card .intercom-interblocks-link-content-container {
    border: none;
  }

  .content-td .messenger-card table {
    border: none;
  }

  .events {
    background-color: #F5F5F5;
    border-collapse: separate;
    border-spacing: 10px;
    table-layout: fixed;
    border-radius: 5px;
    border: 1px solid #E5E5E5;
    padding: 0px 15px 0px 15px;
  }

  .content-td .ratings td,
  .content-td .messenger-card td {
    border: 0;
    padding: 0;
  }

  .content-td .messenger-card td {
    text-align: center;
  }

  .content-td .messenger-card td p {
    font-size: 14px;
    color: #6e7a89;
    text-align: center;
  }


  .rating-link {
    max-width: 27px;
    min-height: 27px;
  }

  .content-td > :first-child {
    margin-top: 0;
    padding-top: 0;
  }

  .content-td h1 {
    font-size: 1.3em;
    font-weight: bold;
    line-height: 25px;
    margin-top: 20px;
    margin-bottom: 5px;
  }

  .content-td h1 + h2 {
    margin-top: 0 !important;
  }

  .content-td h2 + h1 {
    margin-top: 0 !important;
  }

  .content-td h2 {
    font-size: 1.1em;
    font-weight: bold;
    margin: 20px 0 5px;
  }

  .content-td h3 ,
  .content-td h4 ,
  .content-td h5 {
    font-size: 13px;
    font-weight: bold;
    margin-bottom: 5px;
  }

  .content-td p {
    margin: 0 0 15px 0;
  }

  .content-td p.no-margin {
    margin: 0;
    min-height: 15px;
  }

  .content-td p img,
  .content-td h1 img,
  .content-td h2 img,
  .content-td li img,
  .content-td .intercom-h2b-button img {
    margin: 0;
    padding: 0;
  }

  .content-td a {
    color: #1251ba;
    text-decoration: underline;
  }

  .content-td .messenger-card .link {
    margin-bottom: 25px;
  }

  .content-td strong {
    color: #606060;
  }

  .content-td ol,
  .content-td ul {
    margin: 0 0 20px 40px;
    padding: 0;
    list-style: disc;
  }

  .content-td ol {
    list-style: decimal;
  }

  .content-td ol li,
  .content-td ul li {
    margin: 5px 0;
  }

  .content-td blockquote {
    padding: 10px 0;
    margin: 10px 0;
    font-style: italic;
  }

  .content-td blockquote a {
    color: #8C8C8C;
  }

  .content-td img {
    max-width: 100%;
    margin: 15px 0 15px;
  }

  .content-td .intercom-container {
    margin-bottom: 16px;
  }

  .content-td hr {
    border: none;
    border-top: 1px solid #DDD;
    border-bottom: 0;
    margin: 20px 0;
  }

  .content-td table th {
    font-weight: bold;
    background: #F6F6F6;
  }

  .content-td table td,
  .content-td table th {
    padding: 7px 10px;
    border: 1px solid #DADADA;
    text-align: left;
    vertical-align: top;
  }

  .content-td table {
    margin-bottom: 20px;
    border-collapse: collapse;
    border-spacing: 0;
  }

  .content-td table.intercom-container.intercom-align-center {
    margin-left: auto;
    margin-right: auto;
  }

  .content-td table.intercom-container td {
    border: none;
    padding: 0;
    margin: 0;
  }

  .content-td a.reply-in-messenger-button {
    background-color: #286efa;
    color: white;
    padding: 6px 25px;
    margin: 0px 0 16px 0;
    border-radius: 20px;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
  }

  .content-td p.reply-in-messenger-message {
    color: #8c8c8c;
    font-size: 12px;
    margin: 0;
  }

  table.ratings,
  .content-td .messenger-card {
      border-collapse: separate;
      border-spacing: 0;
      table-layout: fixed;
      border-radius: 5px;
      border: 1px solid #dadfe3;
      margin-bottom: 0;
  }

  .content-td table.ratings {
      width: 260px;
      padding: 16px 0;
  }

  table.ratings {
      padding: 16px 0;
  }

  .content-td .ratings table img {
      margin: 0;
  }

  .align_top {
    vertical-align: top;
  }

  .align_center {
      margin: 0 auto;
  }

  /**
   * Footer
   */
   .smiley {
     padding: 4px;
   }
   .feedback_item:first-child .smiley {
     padding-left: 0;
   }
  .divider {
    border: none;
    height: 1px;
    color: #f0f0f0;
    background-color: #f0f0f0;
    margin: 0;
  }
  .feedback-text {
    margin-bottom: 0.3em;
    margin-top: 0;
  }
  .deemphasized_text {
    color: #8c8c8c;
  }
  .sent_to_text {
    font-weight: bold;
  }
  .dark_text {
    color: #222;
  }
  .light_text {
    color: #999;
  }
  .align_middle {
    vertical-align: middle !important;
  }

  .history .history_content {
    font-style: normal;
    padding-top: 1px;
    border-left: 1px #ccc solid;
    margin: 0 0 0 .8ex;
    padding-left: 1ex;
  }
  .history .history_content > *:last-child {
    margin-bottom: 0;
  }
  .powered_by_badge {
    font-size: 14px;
  }
  .powered_by_link {
    color: #8c8c8c;
    font-weight: bold;
    text-decoration: none;
  }

  /**
    * Email signature
    */
  .email_signature .container {
      margin-inline-start: 0;
  }
  .email_signature th {
      font-weight: normal;
  }
  .email_signature p,
  .email_signature h1,
  .email_signature h2 {
      margin: 0;
      padding: 0;
      text-align: start;
  }

  .history {
    color: #500050;
  }

  /**
   * Ticket with attributes
   */

  .ticket_card {
    border: 1px solid #E1E1E1;
    border-radius: 8px;
    width: 100%;
    max-width: 570px;
    word-wrap: break-word;
  }

  .ticket_card .app_logo {
      width: 100%;
      padding: 18px 40px;
      border-bottom: 1px solid #E1E1E1;
  }

  .ticket_card .app_logo img {
      height: 26px !important;
      max-height: 26px !important;
      max-width: 100%;
  }

  .ticket_card .body {
      padding: 28px 40px;
      font-size: 14px;
      font-weight: 400;
      line-height: 16px;
      width: 100%;
  }

  .collapsed_ticket_card .title,
  .ticket_card .title {
      font-size: 18px;
      font-weight: 700;
      line-height: 24px;
  }

  .ticket_card .ticket_state_description {
      font-size: 16px;
      line-height: 20px;
      padding-bottom: 24px;
  }

  .ticket_card .ticket_state_step {
      border-radius: 8px;
      height: 4px;
      margin-bottom: 8px;
  }

  .ticket_card .ticket_state_submitted {
      background-color: #334bfa;
      border-color: #334bfa;
  }

  .ticket_card .ticket_state_in_progress {
      background-color: #b24d00;
      border-color: #b24d00;
  }

  .ticket_card .ticket_state_waiting_on_customer {
      background-color: #db0629;
      border-color: #db0629;
  }

  .ticket_card .ticket_state_resolved {
      background-color: #0f7134;
      border-color: #0f7134;
  }

  .ticket_card .ticket_custom_state_submitted {
      background-color: #334bfa;
      border-color: #334bfa;
  }

  .ticket_card .ticket_custom_state_in_progress {
      background-color: #334bfa;
      border-color: #334bfa;
  }

  .ticket_card .ticket_custom_state_waiting_on_customer {
      background-color: #b24d00;
      border-color: #b24d00;
  }

  .ticket_card .ticket_custom_state_resolved {
      background-color: #0f7134;
      border-color: #0f7134;
  }

  .ticket_card .ticket_state_inactive {
      background-color: #DADADA;
      border-color: #DADADA;
  }

  .ticket_card .ticket_progress {
      font-size: 13px;
      line-height: 16px;
  }

  .ticket_card .ticket_state_label_inactive {
      color: #757575;
  }

  .ticket_card .ticket_state_label_active {
      font-weight: 700;
  }

  .ticket_card .ticket_state_label {
      margin-bottom: 4px;
  }

  .ticket_custom_state .label {
      font-size: 16px;
      font-style: normal;
      font-weight: 700;
      line-height: 30px;
  }

  .ticket_custom_state .submitted {
      color: #334bfa;
  }

  .ticket_custom_state .in_progress {
      color: #334bfa;
  }

  .ticket_custom_state .waiting_on_customer {
      color: #b24d00;
  }

  .ticket_custom_state .resolved {
      color: #0f7134;
  }

  .ticket_card .attribute_name {
      font-weight: 600;
      word-wrap: break-word;
  }

  [dir="rtl"] .ticket_card .ticket_state_spacing {
      padding-left: 8px;
  }

  [dir="ltr"] .ticket_card .ticket_state_spacing {
      padding-right: 8px;
  }

  [dir="rtl"] .ticket_card .attribute_name {
      padding: 8px 0 8px 16px;
  }

  [dir="ltr"] .ticket_card .attribute_name {
      padding: 8px 16px 8px 0;
  }

  .ticket_card .attribute_value {
      word-wrap: break-word;
      padding: 8px 0;
  }

  .ticket_card .ticket_description {
      padding-bottom: 24px;
  }

  .reply_in_messenger_card {
    background: #F5F5F5;
    border-radius: 8px;
    width: 100%;
    max-width: 570px;
    word-wrap: break-word;
    padding: 16px;
  }

  .reply_in_messenger_card .title {
    font-size: 16px;
    font-weight: 600;
    line-height: 24px;
    word-wrap: break-word;
  }

  .reply_in_messenger_card .body {
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
    word-wrap: break-word;
    padding-top: 8px;
  }

  .chat_notification_container {
    width: 100%;
    max-width: 570px;
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
    word-wrap: break-word;
  }

  [dir="rtl"] .chat_notification_container .admin_avatar_wrapper {
    padding-left: 16px;
  }

  [dir="rtl"] .chat_notification_container .user_avatar_wrapper {
      padding-right: 16px;
  }

  [dir="ltr"] .chat_notification_container .admin_avatar_wrapper {
      padding-right: 16px;
  }

  [dir="ltr"] .chat_notification_container .user_avatar_wrapper {
      padding-left: 16px;
  }

  [dir="ltr"] .chat_notification_container .message_bubble {
      margin-left: auto;
  }

  [dir="rtl"] .chat_notification_container .message_bubble {
      margin-right: auto;
  }

  .chat_notification_container .user_avatar_wrapper .initials_avatar {
      border-radius: 100px;
      color: white;
      font-size: 12px;
      height: 28px;
      line-height: 28px;
      width: 28px;
      text-align: center;
  }

  .chat_notification_container .comment_wrapper {
    padding: 12px 16px;
    border-radius: 10px;
    background: #F5F5F5;
  }

  .chat_notification_container .comment_wrapper p {
    margin: 0;
  }

  .chat_notification_container .brand_logo img {
      height: 26px !important;
      max-height: 26px !important;
      max-width: 100%;
  }

  .chat_notification_container .comment_wrapper img {
    max-width: 100% !important;
  }

  .collapsed_ticket_card {
    border: 1px solid #E1E1E1;
    border-radius: 8px;
    padding: 12px 20px;
  }

  .align_middle {
    vertical-align: middle;
  }

  @media (max-width: 768px) {
    .ticket_card .app_logo {
      padding: 18px !important;
    }

    .ticket_card .body {
      padding: 18px !important;
    }

    [dir="rtl"] .ticket_card .ticket_state_spacing {
      padding-left: 2px !important;
    }

    [dir="ltr"] .ticket_card .ticket_state_spacing {
      padding-right: 2px !important;
    }

    .ticket_card .ticket_state_spacing {
      padding-right: 2px !important;
    }

    .ticket_card .ticket_description {
      padding-bottom: 16px !important;
    }
  }

</style>

<!-- Outlook.com -->
<style type="text/css" data-premailer="ignore">
  .content-td blockquote + * {
    margin-top: 10px !important;
  }

  .ExternalClass .content-td h1 {
    padding: 15px 0 5px 0 !important;
  }

  .ExternalClass .content-td h2 {
    padding: 0 0 5px 0 !important;
  }

  .ExternalClass .content-td p {
    padding: 10px 0 !important;
  }

  .ExternalClass .content-td hr + * {
    padding-top: 20px !important;
  }

  .ExternalClass .content-td .intercom-container {
    padding: 5px 0 !important;
  }

  .ExternalClass .content-td ol ,
  .ExternalClass .content-td ul {
    padding: 0 0 20px 40px !important;
    margin: 0 !important;
  }

  img {
    max-width: 600px !important;
  }
  @media (max-width: 600px) {
    img {
      max-width: 100% !important;
    }
  }
</style>


<!-- Outlook fix -->

<!--[if gte mso 9]>
    <style type="text/css">
      table {
        border-collapse: collapse !important;
      }
      td {
        border-collapse: collapse !important;
      }
    </style>
<![endif]-->

</head>

<body id="admin_reply" dir="ltr">
<div style="color:transparent;visibility:hidden;opacity:0;font-size:0px;border:0;max-height:1px;width:1px;margin:0px;padding:0px;border-width:0px!important;display:none!important;line-height:0px!important;"><img border="0" width="1" height="1" src="https://chickenguard-b7d3c18b1b6b.intercom-mail.com/q/8MNMBowYDW-U0kpoC7M2Hg~~/AAAAAQA~/RgRobvK_PVcIaW50ZXJjb21CCmaIv22MZmBZV-lSH2RyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmdYBAAFYvo~" alt=""/></div>

  <table cellspacing="0" border="0" cellpadding="0" align="center" bgcolor="transparent" class="main" style="font-family: Helvetica, Arial, sans-serif; letter-spacing: 0; width: 100%; border-spacing: 0; border-collapse: separate; table-layout: fixed;">
    <tbody>
        <tr>
  <td style="font-family: Helvetica, Arial, sans-serif; padding: 0;">
    <table id="reply_email" style="table-layout: auto; border-spacing: 0; border-collapse: separate;">
      <tbody>

      <tr>
        <td class="content-td" style="font-family: Helvetica, Arial, sans-serif; line-height: 20px; font-size: 14px; padding: 0 0 16px;">
              <div style="margin-top: 0; padding-top: 0;">
<p style="margin: 0 0 15px;">Hi Felix,</p>
<p style="margin: 0 0 15px;">Thank you for your email. It has been received and a member of the team will be in contact as soon as possible. We are usually able to respond to queries within 1-2 working days.</p>
<p style="margin: 0 0 15px;">(If not already given, please let us know  your full name, order number, and purchase date to aid us in supporting you efficiently.)</p>
<p style="margin: 0 0 15px;">In the meantime, please feel free to explore our help centre to see if there is already an answer to your question.</p>
<p style="margin: 0 0 15px;"><a href="https://help.chickenguard.com/en/" target="_blank" class="intercom-content-link" style="outline: none !important; color: #1251ba; text-decoration: underline; border-style: none;">https://help.chickenguard.com/en/</a></p>
<p style="margin: 0 0 15px;">Kind regards,</p>
</div>
        </td>
      </tr>


        <tr>
            <td style="font-family: Helvetica, Arial, sans-serif; padding: 0;">
              <div class="email_signature">
                <table border="0" style="border-spacing: 0; border-collapse: separate; table-layout: fixed;">
  <tbody>
    <tr><td style="font-family: Helvetica, Arial, sans-serif; padding: 0;">
<p style="text-align: start; margin: 0; padding: 0;" align="start"><b>Chip (Support Bot)</b></p>
<p style="text-align: start; margin: 0; padding: 0;" align="start">ChickenGuard </p>
<p style="text-align: start; margin: 0; padding: 0;" align="start"></p>
<p style="text-align: start; margin: 0; padding: 0;" align="start"></p>
<p style="text-align: start; margin: 0; padding: 0;" align="start"></p>
<p style="text-align: start; margin: 0; padding: 0;" align="start">Facebook - <a href="https://www.facebook.com/chickenguard" rel="nofollow noopener noreferrer" target="_blank" class="intercom-content-link" style="outline: none !important; border-style: none;">https://www.facebook.com/chickenguard</a></p>
<p style="color: #222222; text-align: start; margin: 0; padding: 0;" align="start">Instagram - <a href="https://www.instagram.com/chickenguards/" rel="nofollow noopener noreferrer" target="_blank" class="intercom-content-link" style="outline: none !important; border-style: none;">https://www.instagram.com/chickenguards/</a></p>
</td></tr>
    <tr height="4"></tr>
    <tr><td style="font-family: Helvetica, Arial, sans-serif; padding: 0;"><img width="140" height="83" src="https://downloads.intercomcdn.com/i/o/662075775/acf22594733b8c9b66ced565/CG+logo.png"></td></tr>
  </tbody>
</table>

              </div>
            </td>
        </tr>

      
      <tr height="32"></tr>
      </tbody>
    </table>
    <table style="border-spacing: 0; border-collapse: separate; table-layout: fixed;">
      <tbody>
        <tr>
          <td style="font-family: Helvetica, Arial, sans-serif; padding: 0;">
            <div dir="ltr">
              
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </td>
</tr>

    </tbody>
  </table>
<img src="https://chickenguard-b7d3c18b1b6b.intercom-mail.com/via/o?h=48566111849c7afa439ea459f8be8a584ea59ef8-mnjgb56x_157432_21910046954" width="1" height="1" style="display: block;" alt="intercom">

<img border="0" width="1" height="1" alt="" src="https://chickenguard-b7d3c18b1b6b.intercom-mail.com/q/a4iuQJGjPdXe7SQ977c-Zg~~/AAAAAQA~/RgRobvK_PlcIaW50ZXJjb21CCmaIv22MZmBZV-lSH2RyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmdYBAAFYvo~">
</body>
</html>
--_----BeoNQayvnox3IlxY9j8yiA===_4D/75-09702-FBD6C866--

